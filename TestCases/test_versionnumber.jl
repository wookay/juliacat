# test_versionnumber.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_version_number()
  assert_equal(VersionNumber("1.2.3"), VersionNumber(1,2,3))
end

if is_main()
  UnitTest.run()
end
