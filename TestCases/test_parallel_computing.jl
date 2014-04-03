# test_parallel_computing.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

# http://docs.julialang.org/en/latest/stdlib/base/#parallel-computing
function test_parallel_computing()

  # Get the number of available processors
  assert_equal(1, nprocs())

  # Get the id of the current processor
  assert_equal(1, myid())

end

if is_main()
  UnitTest.run()
end
