load("../juliacat/UnitTest.j")

begin
  assert_equal(true, Inf == Inf)
  assert_equal(false, NaN == NaN)
  assert_equal(true, isequal(NaN,NaN))
  assert_equal(true, 2/3 == 2//3)
end
