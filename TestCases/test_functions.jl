# test_functions.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_functions()
  assert_equal(9, +(2,3,4))
  local f = +;
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
  anony = () -> 42
  assert_equal(false, isgeneric(anony)) 
  assert_equal(true, isdefined(anony, :env)) 
  assert_equal(true, isa(anony.env, SimpleVector)) 

  generic() = 42
  assert_equal(true, isgeneric(generic)) 
  assert_equal(true, isdefined(generic, :env)) 
  assert_equal(true, isa(generic.env, MethodTable)) 
end

if is_main()
  UnitTest.run()
end
