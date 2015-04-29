# test_types.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")


function test_restype()
  f(::Type{Bool}) = 1
  f(::Bool) = 2
  f(Bool) = Bool

  assert_equal(1, f(Bool))
  assert_equal(2, f(true))
  assert_equal(3, f(3))
end

begin
  type 학생
    이름::String
    국어::Int
    산수::Int
  end
end

function test_types()
  # The :: operator is read as “is an instance of”
  function k(x::Int)
    x + 1
  end
  function k(x::Any)
    x
  end
  assert_equal(2, k(1))
  assert_equal("ab", k("ab"))

  local 홍 = 학생("홍길동", 100, 80)
  assert_equal("홍길동", 홍.이름)
  assert_equal(100, 홍.국어)
  assert_equal(80, 홍.산수)

  assert_equal(Tuple{}, typeof(()))
  assert_equal(DataType, typeof(Int))
  assert_equal(DataType, typeof(DataType))
  assert_equal(true, isa(1,Int))

  assert_equal(1.0, convert(FloatingPoint, 1))
  assert_equal((1.0,2.0), promote(1, 2.0))
end

if is_main()
  UnitTest.run()
end
