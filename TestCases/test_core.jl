# test_core.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_core()
  assert_equal(Core, @which is)
  assert_true(is == ===)
  assert_true(is(1, 1))
  assert_true(is(1+2, 3))
  assert_true(is(pi, pi))
  assert_false(is == ==)
  assert_false(is("", ""))
  assert_false(is([], []))
end

function test_char()
  x = '\U1f355'
  assert_equal(2, charwidth(x))
  assert_true(isa(x, Char))
  assert_isa(x, Char)
end

if is_main()
  UnitTest.run()
end
