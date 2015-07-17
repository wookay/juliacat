# test_base.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_base()
  assert_equal(Base, @which pi)
end

function test_comparison_operator()
  assert_true(1 < 2 < 3)
  assert_true(1 ≤ 1 ≤ 1 ≤ 1 ≤ 1)
end

if is_main()
  UnitTest.run()
end
