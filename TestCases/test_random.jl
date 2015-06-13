# test_random.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_random()
  assert_equal(20, rand(1:50, 20) |> length)
  assert_equal(Int, rand(1:50) |> typeof)
end

if is_main()
  UnitTest.run()
end
