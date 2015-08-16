# test_types_more.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_multiple_dispatch()
  f(::Type{Bool}) = 1
  f(::Bool) = 2

  assert_equal(1, f(Bool))
  assert_equal(2, f(true))
end

type Say
end
function test_singleton()
  hi(::Type{Say}) = 42
  assert_equal(42, hi(Say))
end

begin
  abstract 사람
  type 선생님 <: 사람
    이름::String
  end
  type 학생{Score<:Int} <: 사람
    이름::String
    국어::Score
    산수::Score
  end
end

function test_custom_types()
  선생 = 선생님("아무개")
  assert_equal("아무개", 선생.이름)

  홍 = 학생("홍길동", 100, 80)
  assert_equal("홍길동", 홍.이름)
  assert_equal(100, 홍.국어)
  assert_equal(80, 홍.산수)

  assert_equal([선생님, 학생], subtypes(사람))

  if VERSION.minor > 3
    assert_isa(선생, 사람)
    assert_isa(홍, 사람)
  end
end



if VERSION.minor > 3 @eval begin

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

  assert_equal(Tuple{}, typeof(()))
  assert_equal(DataType, typeof(Int))
  assert_equal(DataType, typeof(DataType))
  assert_equal(true, isa(1,Int))

  assert_equal(1.0, convert(FloatingPoint, 1))
  assert_equal((1.0,2.0), promote(1, 2.0))

  assert_equal(issubtype, <:)
end

function test_supertypes()

  function supertypes(v)
    types = Type[]
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

function test_union()
  assert_equal(Union{Int,String}, Union{String,Int})

  IntOrString = Union{Int, String}
  f(x::IntOrString) = typeof(x)

  assert_equal(Int, f(1))
  assert_equal(ASCIIString, f(""))

  assert_equal(Int64, Union{Int64, Base.Bottom})

  assert_equal(Union{Int,String}, Union{String,Union{Int}})
end

function test_fieldnames()
  assert_equal([:dict], fieldnames(Set))
  assert_equal([:dict], fieldnames(Set()))
end

function test_set_theoretic_types()
  assert_equal(Int64,
    typeintersect(Union{Int64,ASCIIString}, Int64))
  assert_equal(Union{Int64,ASCIIString},
    typejoin(Int, Union{ASCIIString, Int}))
end

function test_nullable_more()
  obj = Nullable(1)
  assert_isa(obj, Nullable{Int64})
  assert_false(isnull(obj))
  assert_equal(1, get(obj))
  
  nul = Nullable{Int}()
  assert_isa(nul, Nullable{Int})
  assert_true(isnull(nul))
  Base.Test.@test_throws NullException get(nul)
end

end end


if is_main()
  UnitTest.run()
end
