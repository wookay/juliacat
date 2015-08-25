# test_core.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_equality()
  assert_true(1  == 1.0)
  assert_true("" == "")
  assert_true([] == [])

  assert_equal(is, ===)

  assert_false(1  === 1.0)
  assert_false("" === "")
  assert_false([] === [])

  assert_true(-0 === 0)
  assert_false(-0.0 === 0.0)

  if VERSION.minor > 3 @eval begin
    assert_equal(Core, @which is)
  
    assert_true(1 ≈ 1.00000001)
    assert_false(1 ≈ 1.0000001)
  
  end end
end

function test_char()
  x = '\U1f355'
  assert_true(isa(x, Char))
  assert_isa(x, Char)

  if VERSION.minor > 3 @eval begin
    x = '\U1f355'
    assert_equal(2, charwidth(x))
  end end

end


function test_nothing()
  assert_equal(nothing, eval(symbol(string(nothing))))

  if VERSION.minor > 3 @eval begin
    assert_isa(nothing, Void)
  end end

end



if VERSION.minor > 3 @eval begin

import Base: +
function test_vararg()

  Base.Test.@test_throws UndefVarError +(())
  Base.Test.@test_throws UndefVarError +((1,2))

  +(a::Tuple{Vararg{Int}}) = string(a)

  Base.Test.@test_throws MethodError +(())
  Base.Test.@test_throws MethodError +((1))
  Base.Test.@test_throws MethodError +((1,))
  Base.Test.@test_throws MethodError +((1...))
  Base.Test.@test_throws MethodError +((1,2))

  tup = ()
  assert_equal("()" , +(tup) )

  tup = (1)
  Base.Test.@test_throws MethodError +(tup)

  tup = (1,)
  assert_equal("(1,)" , +(tup) )

  tup = (1...)
  assert_equal("(1,)" , +(tup) )

  tup = (1,2)
  assert_equal("(1,2)" , +(tup) )
end

end end


function test_invoke()
  f(a) = 2a
  assert_equal(6, invoke(f, (Int,), 3))
end

if is_main()
  UnitTest.run()
end
