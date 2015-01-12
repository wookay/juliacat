# test_throw.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

using Base.Test

function test_throw()
  @test 3 == convert(Int, 3.0)
  @test_throws InexactError convert(Int, 3.1)
  @test_throws InexactError throw(InexactError())
end

if is_main()
  UnitTest.run()
end
