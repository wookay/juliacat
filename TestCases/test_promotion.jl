# test_promotion.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")


function test_promotion()
  assert_equal((1.0,3.14), promote(1, 3.14))
  assert_equal((1.0,3.14), promote(1, 3.14))
  assert_equal(Int, promote_type(Int, UInt16))
end

if is_main()
  UnitTest.run()
end
