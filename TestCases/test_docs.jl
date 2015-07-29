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
  assert_equal(doc"wal wal", funcdoc.meta[b])
  assert_isa(funcdoc.source[b], Expr)
  assert_equal("""
function bark() # $(@__FILE__), line 13:
    1 + 2 # line 14:
    42
end""", funcdoc.source[b] |> string)

end


end end


if is_main()
  UnitTest.run()
end
