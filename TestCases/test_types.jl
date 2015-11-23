# test_types.jl
#                           wookay.noh at gmail.com

if !(VERSION.minor > 3)
  macro enum(t...)
  end
  println("Required Julia 0.4")
end

include("../juliacat/UnitTest.jl")


function test_int()
  assert_true(isa(2, Int))
  assert_equal("Int64", string(typeof(2)))
end

function test_float()
  assert_true(isa(3.14, Float64))
  assert_equal("Float64", string(typeof(3.14)))

  assert_true(pi > 3.14)
  assert_true(isa(pi, Irrational))
end

function test_string()
  assert_true(isa("", AbstractString))
  assert_equal("ASCIIString", string(typeof("")))
end

function test_array()
  assert_true(isa(Any[], Array{Any,1}))
  assert_equal("Array{Any,1}", string(typeof(Any[])))

  assert_false(isa(Int[], Array{Any,1}))
  assert_false(isa(Any[], Array{Int,1}))
end

function test_dict()
  assert_true(isa(Dict{Int,Any}(), Dict{Int,Any}))
  assert_equal("Dict{Int64,Any}", string(typeof(Dict{Int,Any}())))
end

function test_function()
  f() = nothing
  assert_true(isa(f, Function))
  assert_equal("Function", string(typeof(f)))
  assert_equal([Void], Base.return_types(f, ()))
end


@enum ABC A B

function test_enum()
  assert_true(isa(A, ABC))
  assert_equal("ABC", string(typeof(A)))
  if VERSION.minor >= 5
    assert_equal("B::ABC = 1", repr(B))
  end
end


type AbcBox
  v::Any

  AbcBox() = new(0)
end

function test_type()
  t = AbcBox()
  assert_true(isa(t, AbcBox))
  assert_equal("AbcBox", string(typeof(t)))
end

function test_range()
  assert_true(isa(1:5, Range))
  assert_equal("UnitRange{Int64}", string(typeof(1:5)))
  assert_equal(5, length(1:5))
end

function test_tuple()
  assert_true(isa((), Tuple{}))
  assert_equal("Tuple{}", string(typeof(())))
end

function test_nullable()
  n = Nullable(1)
  assert_equal(1, get(n))
end


if is_main()
  UnitTest.run()
end
