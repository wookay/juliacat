# test_loading.jl
#                           wookay.noh at gmail.com


push!(Base.LOAD_CACHE_PATH, dirname(@__FILE__))

include("../juliacat/UnitTest.jl")


if VERSION.minor > 3 @eval begin

using PreM

function test_loading()
end

end end


if is_main()
  UnitTest.run()
end
