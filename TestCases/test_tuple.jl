# test_tuple.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_tuple()
  assert_equal(Tuple{Int}, Tuple{[Int]...})
end

if is_main()
  UnitTest.run()
end
