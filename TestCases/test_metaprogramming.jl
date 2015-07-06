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

macro m(expr)
  if isa(expr, Symbol)
    nothing, Expr(expr)
  elseif isa(expr, Expr)
    nothing, expr
  end
end
function test_meta()
  _,expr = @m entry
  assert_equal(:entry, expr.head)
  assert_true(Meta.isexpr(expr, :entry))
  assert_equal(Any[], expr.args)
  _,expr = @m entry()
  assert_equal(:call, expr.head)
  assert_true(Meta.isexpr(expr, :call))
  assert_equal(Any[:entry], expr.args)
end

if is_main()
  UnitTest.run()
end
