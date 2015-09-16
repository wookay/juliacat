# UnitTest.jl
#                           wookay.noh at gmail.com


macro loading(modul)
  print("loading $modul ")
  expr = Expr(:using, modul)
  elapsed = @elapsed eval(expr)
  println("elapsed in $elapsed seconds.")
end

function show_backtrace()
  b = backtrace()[4]
  lkup = ccall(:jl_lookup_code_address, Any, (Ptr{Void}, Cint), b, true)
  fname, file, line, inlinedat_file, inlinedat_line, fromC = lkup
  buf = IOBuffer()
  n = 0
  Base.show_trace_entry(buf, fname, file, line, inlinedat_file, inlinedat_line, n)
  trace = takebuf_string(buf)
  close(buf)
  lstrip(trace)
end

function _assert_equal_func(result::Bool, expected, got)
  if result
    UnitTest.passed += 1
    if UnitTest.dot_if_passed
      print(".")
    else
      print("passed: $expected\n")
    end
  else
    UnitTest.failed += 1
    Base.have_color && print("\033[31m")
    print("\nAssertion failed $(show_backtrace())")
    Base.have_color && print("\033[0m")
    print("\nExpected: $expected\n     Got: $got\n")
  end
end

function assert_equal(expected::Float64, got::Float64)
  _assert_equal_func(isapprox(expected, got), expected, got)
end

function assert_equal(expected, got)
  _assert_equal_func(expected == got, expected, got)
end

function assert_not_equal(expected, got)
  _assert_equal_func(expected != got, expected, got)
end

function assert_true(got::Bool)
  _assert_equal_func(true == got, true, got)
end

function assert_false(got::Bool)
  _assert_equal_func(false == got, false, got)
end

function assert_isa{T}(got::T, typ::Type{T})
  _assert_equal_func(isa(got, typ), true, got)
end

function is_main()
  !isdefined(:IsNotMain)
end

if isdefined(:UnitTestBase)
else
  type UnitTestBase
    run::Function
    dot_if_passed::Bool
    passed::Int
    failed::Int
  end
end

function runner(; debug = false)
  local setupAt = time()
  local tests = 0
  local errors = 0
  print("Started\n")
  for fun = names(Main)
    if ismatch(r"^test_", string(fun))
      if debug
        println("\n$fun")
      end
      tests += 1
      try
        eval(Expr(:call, fun))
      catch err
        errors += 1
        Base.have_color && print("\033[31m")
        println("$err in $fun")
        Base.have_color && print("\033[0m")
      end
    end
  end
  @printf("\nFinished in %.4f seconds.\n", time() - setupAt)
  fail = UnitTest.failed > 0 || errors > 0
  Base.have_color && print("\033[$(fail ? 31 : 32)m")
  
  @printf("%d tests, %d assertions, %d failures, %d errors\n",
    tests, UnitTest.passed, UnitTest.failed, errors)

  Base.have_color && print("\033[0m")

  fail
end

UnitTest = UnitTestBase(runner, true, 0, 0)
