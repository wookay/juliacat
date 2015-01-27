# test_stagedfunction.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

stagedfunction staged(a)
  assert_equal(Int, a)
  :(a + 2)
end

function test_stagedfunction()
  assert_equal(3, staged(1))
end

if is_main()
  UnitTest.run()
end
