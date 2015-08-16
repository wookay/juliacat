# test_reflection.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_reflection()
  assert_equal("test_reflection.jl", basename(functionloc(test_reflection, ())[1]))
  assert_equal("reflection.jl", basename(functionloc(functionloc, (Any,))[1]))
  assert_equal("show.jl", basename(functionloc(xdump, (Any,))[1]))
end


if VERSION.minor > 3 @eval begin

function test_return_types()
  function f(a::Int)
    a ? 1 : ""
  end
  function f(a::String)
    a ? 1.0 : ""
  end
  assert_equal([Union{Int64,ASCIIString}], Base.return_types(f, Tuple{Int}))
  assert_equal(Any[Union{ASCIIString,Float64}], Base.return_types(f, Tuple{String}))
  assert_equal(Any[Union{ASCIIString,Int64},Union{ASCIIString,Float64}], Base.return_types(f, (Any,)))

  f(a) = rand([a]) ? 1 : nothing
  assert_equal(Any[Union{ASCIIString,Int64},Union{ASCIIString,Float64},Union{Int64,Void}], Base.return_types(f, (Any,)))
end

function test_type_type()
  assert_isa(Int, Type)
end

end end

if is_main()
  UnitTest.run()
end
