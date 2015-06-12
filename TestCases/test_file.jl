# test_file.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_file()
  assert_equal("test_file.jl", basename(@__FILE__))
end

if is_main()
  UnitTest.run()
end
