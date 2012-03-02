# test_mathematical-operations.j
#                           wookay.noh at gmail.com

load("../juliacat/UnitTest.j")

function test_mathematical_operations()
  assert_equal(true, Inf == Inf)
  assert_equal(false, NaN == NaN)
  assert_equal(true, isequal(NaN,NaN))
  assert_equal(true, 2/3 == 2//3)
end

if is_main()
  UnitTest.run()
end
