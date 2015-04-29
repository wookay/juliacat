# test_enums.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

@enum 놈타입   이놈 저놈

function test_enums()

  assert_equal(0, Int(이놈))
  assert_equal(1, 저놈.val)
  assert_equal(저놈, typemax(놈타입))
  assert_equal(2, length(놈타입))
  assert_equal(이놈, 놈타입(0))

end

if is_main()
  UnitTest.run()
end
