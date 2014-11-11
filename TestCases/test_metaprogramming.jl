# test_metaprogramming.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_metaprogramming()
  local expr = :(1+2)
  assert_equal(Expr, typeof(expr))
  assert_equal(:call, expr.head)
  assert_equal([:+,1,2], expr.args)
  assert_equal(Any, expr.typ)
  assert_equal(3, eval(expr))
  assert_equal(expr, Expr(:call,:+,1,2))
end

if is_main()
  UnitTest.run()
end
