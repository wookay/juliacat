# test_macro.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

macro m()
  1 
end

function test_macro()
  assert_equal(1, @m)
end

if is_main()
  UnitTest.run()
end
