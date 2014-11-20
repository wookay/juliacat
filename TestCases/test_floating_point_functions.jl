# test_floating_point_functions.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_floating_point_functions()
  assert_equal(false, 0.3 == 0.1+0.2)
  assert_equal(true, isapprox(0.3, 0.1+0.2))
  assert_equal(0.3, 0.1+0.2)
end

if is_main()
  UnitTest.run()
end
