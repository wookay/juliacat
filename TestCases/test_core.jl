# test_core.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_core()
  assert_true(is == ===)
  assert_true(is(1, 1))
  assert_true(is(1+2, 3))
  assert_true(is(pi, pi))
  assert_false(is == ==)
  assert_false(is("", ""))
  assert_false(is([], []))

if VERSION.minor > 3 @eval begin
  assert_equal(Core, @which is)
end end

end

function test_char()
  x = '\U1f355'
  assert_true(isa(x, Char))
  assert_isa(x, Char)

if VERSION.minor > 3 @eval begin
  x = '\U1f355'
  assert_equal(2, charwidth(x))
end end

end

function test_nothing()
  assert_equal(nothing, eval(symbol(string(nothing))))

if VERSION.minor > 3 @eval begin
  assert_isa(nothing, Void)
end end

end


function test_invoke()
  f(a) = 2a
  assert_equal(6, invoke(f, (Int,), 3))
end

if is_main()
  UnitTest.run()
end
