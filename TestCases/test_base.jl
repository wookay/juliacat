# test_base.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

if VERSION.minor > 3 @eval begin

function test_base()
  assert_equal(Base, @which pi)
end

end end

function test_abs()
  assert_equal(abs2(-3), abs(-3)^2)
end

function test_comparison_operator()
  assert_true(1 < 2 < 3)
  assert_true(1 ≤ 1 ≤ 1 ≤ 1 ≤ 1)
end

if is_main()
  UnitTest.run()
end
