# test_stream.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

if VERSION.minor > 3 @eval begin

function test_io()
  assert_isa(STDOUT, Base.IO)
end

end end

if is_main()
  UnitTest.run()
end
