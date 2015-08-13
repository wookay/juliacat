# test_javacall.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

using JavaCall
JavaCall.init(["-ea", "-Xmx10M"])

function test_javacall()
  Math = @jimport java.lang.Math
  assert_equal(1.0, jcall(Math, "sin", jdouble, (jdouble,), pi/2))
end

if is_main()
  UnitTest.run()
end
