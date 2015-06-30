# test_versionnumber.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

import Base: nextmajor

function test_version_number()
  version = v"0.4.0-dev+3929"
  assert_equal(0, version.major)
  assert_equal(4, version.minor)
  assert_equal(0, version.patch)
  assert_equal(("dev",), version.prerelease)
  assert_equal((3929,), version.build)
  assert_equal(VersionNumber("1.2.3"), VersionNumber(1,2,3))
end

function test_nextmajor_version()
  assert_equal(v"1.0.0", nextmajor(VERSION))
  assert_equal(v"2.0.0", nextmajor(v"1.0.0"))
end

if is_main()
  UnitTest.run()
end
