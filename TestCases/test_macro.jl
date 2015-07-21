# test_macro.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

macro m0()
  :p
end

macro m1(a)
  a
end

macro m2(a, b)
  Symbol("$a$b")
end

function test_macro()
  p = 5
  assert_equal(5, @m0)

  assert_equal(2, @m1 2)

  assert_equal(pi, @m2 p i)
end

if is_main()
  UnitTest.run()
end
