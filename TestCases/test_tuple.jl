# test_tuple.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_tuple()

  if VERSION.minor > 3 @eval begin
  assert_equal(Tuple{Int}, Tuple{[Int]...})
  end end

  a = (1,2,3,)
  assert_equal([1,2,3], [a...])
  assert_equal([1,2,3], collect(a))
end

if is_main()
  UnitTest.run()
end
