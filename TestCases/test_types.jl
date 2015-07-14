# test_types.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")


function test_supertypes()

  function supertypes(v)
    types = []
    T = typeof(v)
    while true
      push!(types, T)
      if isa(Any, T)
        break
      end
      T = super(T)
    end
    types
  end

  assert_equal([ASCIIString,DirectIndexString,AbstractString,Any], supertypes(""))
  assert_equal([Int64,Signed,Integer,Real,Number,Any], supertypes(0))
  assert_equal([Float64,FloatingPoint,Real,Number,Any], supertypes(3.14))
  assert_equal([MathConst{:π},Real,Number,Any], supertypes(pi))
  assert_equal([Dict{Any,Any},Associative{Any,Any},Any], supertypes(Dict()))
  assert_equal([Tuple{},Any], supertypes(()))
  assert_equal([Array{Any,1},DenseArray{Any,1},AbstractArray{Any,1},Any], supertypes([]))
  assert_equal([SparseMatrixCSC{Float64,Int64},AbstractSparseArray{Float64,Int64,2},AbstractArray{Float64,2},Any], supertypes(speye(0)))

  assert_equal((Int8,UInt8,Int16,UInt16,Int32,UInt32,Int64,UInt64,Int128,UInt128), Base.IntTypes)
end

function test_restype()
  f(::Type{Bool}) = 1
  f(::Bool) = 2

  assert_equal(1, f(Bool))
  assert_equal(2, f(true))
end

begin
  abstract 사람
  type 선생님 <: 사람
    이름::String
  end
  type 학생{T<:Int} <: 사람
    이름::String
    국어::T
    산수::T
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

  assert_equal(issubtype, <:)
end

function test_fieldnames()
  assert_equal([:dict], fieldnames(Set))
  assert_equal([:dict], fieldnames(Set()))
end

type Say
end
function test_singleton()
  hi(::Type{Say}) = 42
  assert_equal(42, hi(Say))
end

function test_union()
  assert_equal(Union{Int,String}, Union{String,Int})
end

if is_main()
  UnitTest.run()
end
