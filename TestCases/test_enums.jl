# test_enums.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

if !(VERSION.minor > 3)
  macro enum(t...)
  end
end

@enum 혈액형 O형 A형 B형 AB형

if VERSION.minor > 3 @eval begin

function test_enums()
  assert_equal(0, Int(O형))
  assert_equal(1, Int(A형))
  assert_equal(O형, 혈액형(0))
  assert_equal(O형, typemin(혈액형))
  assert_equal(AB형, typemax(혈액형))
  assert_equal((O형,A형,B형,AB형), instances(혈액형))
  assert_equal("A형", string(A형))
  assert_equal("A형::혈액형", repr(A형))
end

end end

if is_main()
  UnitTest.run()
end
