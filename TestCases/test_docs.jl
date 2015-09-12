# test_docs.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

module Dog

"dog"
Dog

"wal wal"
function bark()
  1 + 2
  42
end

end


if VERSION.minor > 3 @eval begin

function test_dog()
  m = Base.Docs.meta(Dog)
  assert_equal(doc"dog", m[Dog])

  funcdoc = m[Dog.bark]
  b = methods(Dog.bark, ())[1]
  assert_equal("bark() at $(@__FILE__):13", string(b))
  assert_equal(string(doc"wal wal".content), string(funcdoc.meta[Tuple{}].content))
  assert_isa(funcdoc.source[Tuple{}], Expr)
  assert_equal("""
function bark() # $(@__FILE__), line 13:
    1 + 2 # $(@__FILE__), line 14:
    42
end""", funcdoc.source[Tuple{}] |> string)

end


end end


if is_main()
  UnitTest.run()
end
