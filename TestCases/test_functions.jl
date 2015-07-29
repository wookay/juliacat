# test_functions.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_functions()
  assert_equal(9, +(2,3,4))
  local f = +
  assert_equal(9, f(2,3,4))

  assert_equal(6, reduce(-, 9, [2,1]))
  assert_equal(7, reduce(-, 9, 2))

  local g = x -> x^2 + 2x - 1
  assert_equal(14, g(3))

  h(x,y) = x + y
  assert_equal(3, h(1,2))

  assert_equal((2,3,4), map(x->x+1, (1,2,3)))
  assert_equal([2,3,4], map(x->x+1, [1,2,3]))

  m(x) = x, x+1
  assert_equal((1,2), m(1))

  function k(x)
    if Int == typeof(x)
      x + 1
    else
      x
    end
  end
  assert_equal(2, k(1))
  assert_equal("ab", k("ab"))
end

function test_generic()

if VERSION.minor > 3 @eval begin
  anony = () -> 42
  assert_false(isgeneric(anony))
  assert_true(isdefined(anony, :env))
  assert_isa(anony.env, SimpleVector)
end end

  generic() = 42
  assert_true(isgeneric(generic))
  assert_true(isdefined(generic, :env))
  assert_isa(generic.env, MethodTable)
end

function test_do()
  f(block) = block(2)
  result = f() do a
             a+1
           end
  assert_equal(3, result)

  f(block) = block(2, 3)
  result = f() do a, b
             a+b
           end
  assert_equal(5, result)
  assert_equal(5, f((a,b) -> a+b))
end

function test_varargs_functions()
  f(a...) = length(a)
  assert_equal(0, f())
  assert_equal(1, f([1,2]))
end

function test_optional_arguments()
  f(;a=3) = a
  assert_equal(3, f())
  assert_equal(1, f(a=1))
end


if VERSION.minor > 3 @eval begin


# staged function
@generated function gen(x)
  assert_equal(Int, x)
  :(x + 2)
end

function test_generated()
  f = gen(1)
  assert_equal(3, f)
end


end end

if is_main()
  UnitTest.run()
end
