# test_loading.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")


if VERSION.minor > 3 @eval begin

push!(Base.LOAD_PATH, dirname(@__FILE__))
push!(Base.LOAD_CACHE_PATH, dirname(@__FILE__))

using PreM

function test_loading()
end

end end


if is_main()
  UnitTest.run()
end
