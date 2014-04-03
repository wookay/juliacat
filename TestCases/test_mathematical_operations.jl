# test_mathematical_operations.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_mathematical_operations()
  assert_equal(true, Inf == Inf)
  assert_equal(false, NaN == NaN)
  assert_equal(true, isequal(NaN,NaN))
  assert_equal(false, 2/3 == 2//3)
end

if is_main()
  UnitTest.run()
end
