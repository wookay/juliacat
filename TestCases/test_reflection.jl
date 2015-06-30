# test_reflection.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_reflection()
  assert_equal("test_reflection.jl", basename(functionloc(test_reflection, ())[1]))
  assert_equal("reflection.jl", basename(functionloc(functionloc, (Any,))[1]))
  assert_equal("show.jl", basename(functionloc(xdump, (Any,))[1]))
end

if is_main()
  UnitTest.run()
end
