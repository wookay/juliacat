# test_reflection.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_reflection()
  assert_equal("test_reflection.jl", basename(functionloc(test_reflection, ())[1]))
  assert_equal("reflection.jl", basename(functionloc(functionloc, (Any,))[1]))
  assert_equal("show.jl", basename(functionloc(xdump, (Any,))[1]))
end

function test_return_types()
  function f(a::Int)
    a ? 1 : ""
  end
  function f(a::String)
    a ? 1.0 : ""
  end

  assert_equal([Union{Int64,ASCIIString},Union{Float64,ASCIIString}], Base.return_types(f, Tuple{Any}))
  assert_equal([Union{Float64,ASCIIString}], Base.return_types(f, Tuple{String}))
  assert_equal([Union{Int64,ASCIIString}], Base.return_types(f, Tuple{Int}))
end

if is_main()
  UnitTest.run()
end
