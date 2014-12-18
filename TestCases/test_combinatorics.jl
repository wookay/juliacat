# test_combinatorics.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_permutations()
  assert_equal(Any[[1,2],[2,1]], collect(permutations([1,2])))
end

if is_main()
  UnitTest.run()
end
