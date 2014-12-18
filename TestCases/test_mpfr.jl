# test_mpfr.jl
#                           wookay.noh at gmail.com

# multiple-precision floating-point computations with correct rounding

include("../juliacat/UnitTest.jl")

function test_mpfr()
  assert_equal(2, ceil(Int, 2.0))
  assert_equal(3, ceil(Int, 2.1))
end

if is_main()
  UnitTest.run()
end
