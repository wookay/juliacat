# test_enums.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

@enum 혈액형 O A B AB

function test_enums()
  assert_equal(0, Int(O))
  assert_equal(1, A.val)
  assert_equal(O, 혈액형(0))
  assert_equal(O, typemin(혈액형))
  assert_equal(AB, typemax(혈액형))
  assert_equal((O,A,B,AB), instances(혈액형))
  assert_equal("A", string(A))
  assert_equal("A::혈액형", repr(A))
end

if is_main()
  UnitTest.run()
end
