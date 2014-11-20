# UnitTest.jl
#                           wookay.noh at gmail.com

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
    print("Assertion failed\nExpected: $expected\nGot: $got\n")
  end
end

function assert_equal(expected::Float64, got::Float64)
  _assert_equal_func(isapprox(expected, got), expected, got)
end    

function assert_equal(expected, got)
  _assert_equal_func(expected == got, expected, got)
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
UnitTest = UnitTestBase(
  function()
    local setupAt = time()
    local tests = 0
    print("Started\n")
    for fun = names(Main)
      if ismatch(r"^test_", string(fun))
        tests += 1
        local expr = Expr(:call, fun)
        eval(expr)
      end
    end
    @printf("\nFinished in %.4f seconds.\n", time() - setupAt)
    @printf("%d tests, %d assertions, %d failures, %d errors\n",
      tests,
      UnitTest.passed,
      UnitTest.failed,
      0)
  end,
  true,
  0,
  0
)
