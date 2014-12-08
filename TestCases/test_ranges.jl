# test_ranges.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_ranges()
  assert_equal(6, length(3:8))
  assert_equal(1, (1:2).start)
  assert_equal(2, (1:2).stop)
  assert_equal(1, rand(1:1))
end

if is_main()
  UnitTest.run()
end
