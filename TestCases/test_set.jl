# test_set.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_set()
  assert_equal([1,2], unique([1,1,2]))
  assert_equal([1,2], unique([1,2,1]))
end

if is_main()
  UnitTest.run()
end
