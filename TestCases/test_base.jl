# test_base.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_base()
  assert_equal(Base, @which pi)
end

if is_main()
  UnitTest.run()
end
