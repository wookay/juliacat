# test_mathematical_operations.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_mathematical_operations()
  assert_equal(true, Inf == Inf)
  assert_equal(false, NaN == NaN)
  assert_equal(true, isequal(NaN,NaN))
  assert_equal(false, 2/3 == 2//3)
end

function test_trigonometric()
  assert_equal(90.0, rad2deg(pi/2))
  assert_equal(1.0, sind(90))
  assert_equal(1.0, sin(pi/2))
end

if is_main()
  UnitTest.run()
end
