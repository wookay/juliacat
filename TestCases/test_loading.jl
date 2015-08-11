# test_loading.jl
#                           wookay.noh at gmail.com

!(VERSION.minor > 3) && println("Required Julia 0.4")

include("../juliacat/UnitTest.jl")


push!(Base.LOAD_PATH, dirname(@__FILE__))
push!(Base.LOAD_CACHE_PATH, dirname(@__FILE__))

using PreM

function test_loading()
end


if is_main()
  UnitTest.run()
end
