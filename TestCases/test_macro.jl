# test_macro.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

# staged function
@generated function gen(x)
  assert_equal(Int, x)
  :(x + 2)
end

function test_generated()
  f = gen(1)
  assert_equal(3, f)
end

if is_main()
  UnitTest.run()
end
