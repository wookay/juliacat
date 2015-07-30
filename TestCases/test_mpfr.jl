# test_mpfr.jl
#                           wookay.noh at gmail.com

# multiple-precision floating-point computations with correct rounding

include("../juliacat/UnitTest.jl")

if VERSION.minor > 3 @eval begin

function test_round()
  a =          [2.0 2.1 2.2 2.3 2.4  2.5 2.6 2.7 2.8 2.9]
  assert_equal([2   2   2   2   2    2   2   2   2   2  ], round(Int, a, RoundToZero))
  assert_equal([2   3   3   3   3    3   3   3   3   3  ], round(Int, a, RoundUp))
  assert_equal([2   2   2   2   2    2   2   2   2   2  ], round(Int, a, RoundDown))
  assert_equal([2   2   2   2   2    3   3   3   3   3  ], round(Int, a, RoundNearestTiesAway))
  assert_equal([2   2   2   2   2    3   3   3   3   3  ], round(Int, a, RoundNearestTiesUp))
  assert_equal([2   2   2   2   2    2   3   3   3   3  ], round(Int, a))
end

function test_floor()
  a =          [2.0 2.1 2.2 2.3 2.4  2.5 2.6 2.7 2.8 2.9]
  assert_equal([2   2   2   2   2    2   2   2   2   2  ], floor(Int, a))
end

function test_ceil()
  a =          [2.0 2.1 2.2 2.3 2.4  2.5 2.6 2.7 2.8 2.9]
  assert_equal([2   3   3   3   3    3   3   3   3   3  ], ceil(Int, a))
end

function test_trunc()
  a =          [2.0 2.1 2.2 2.3 2.4  2.5 2.6 2.7 2.8 2.9]
  assert_equal([2   2   2   2   2    2   2   2   2   2  ], trunc(Int, a))
end

end end

if is_main()
  UnitTest.run()
end
