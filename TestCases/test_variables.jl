# test_variables.jl
#                           wookay.noh at gmail.com

!(VERSION.minor > 3) && println("Required Julia 0.4")

include("../juliacat/UnitTest.jl")


function test_variables()
  + = -
  assert_equal(-3, 2+5)
end


if is_main()
  UnitTest.run()
end
