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

if is_main()
  UnitTest.run()
end
