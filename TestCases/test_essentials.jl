# test_essentials.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_colon()
  assert_equal(:, Colon())
end

if is_main()
  UnitTest.run()
end
