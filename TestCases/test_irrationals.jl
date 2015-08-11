# test_irrationals.jl
#                           wookay.noh at gmail.com

!(VERSION.minor > 3) && println("Required Julia 0.4")

include("../juliacat/UnitTest.jl")


function test_irrationals()
  assert_isa(pi, Irrational{:π})
end


if is_main()
  UnitTest.run()
end
