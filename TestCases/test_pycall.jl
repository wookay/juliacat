# test_pycall.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

using PyCall

function test_numpy()
  @pyimport numpy as np
  assert_equal(2.0, np.mean([1,2,3]))
end

if is_main()
  UnitTest.run()
end
