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

function test_vararg()
  +(a::Tuple{Vararg{Int}}) = string(a)
  assert_equal("()"      , +(())      )
  assert_equal("(1,)"    , +((1...))  )
  assert_equal("(1,)"    , +((1,))    )
  assert_equal("(1,2)"   , +((1,2))   )
  assert_equal("(1,2,3)" , +((1,2,3)) )
  Base.Test.@test_throws MethodError +((1))
end

end end


function test_invoke()
  f(a) = 2a
  assert_equal(6, invoke(f, (Int,), 3))
end

if is_main()
  UnitTest.run()
end
