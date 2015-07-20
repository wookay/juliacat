# test_arrays.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_arrays_basic_functions()
  assert_equal(1, ndims([1,2,3]))
  assert_equal((3,), size([1,2,3]))
  assert_equal(Int, eltype([1,2,3]))
  assert_equal(3, length([1,2,3]))
  assert_equal(3, countnz([1,2,3,0]))

  assert_equal([1 4;2 5;3 6], reshape(1:6, 3, 2))
  assert_equal(2, ndims([1 4;2 5;3 6]))
  assert_equal((3,2), size([1 4;2 5;3 6]))
  assert_equal(1, [1 4;2 5;3 6][1])

  assert_equal([1 3 5;2 4 6], reshape(1:6, 2, 3))
  assert_equal(2, ndims([1 3 5;2 4 6]))
  assert_equal((2,3), size([1 3 5;2 4 6]))
  assert_equal(1, [1 3 5;2 4 6][1])

  A = [1 2;3 4;5 6]
  assert_equal([(1,2), (3,4), (5,6)], [(A[n,1],A[n,2]) for n in 1:size(A,1)])

  assert_equal(2, ndims(reshape(1:9, 3, 3)))

  assert_equal([1, 2, 3], append!([1, 2], [3]))
  assert_equal(3, pop!([1, 2, 3]))
end

function test_array_expression()
  assert_equal([1,2,3], [1;2;3])
  assert_equal([1,2,3], [1 2 3][:])
  assert_equal([1,2,3], [1;2;3][:])
  assert_equal([1 2 3], [1;2;3]')
  assert_equal([1 2 3], [1,2,3]')
  assert_equal(hcat([1;2;3]), [1 2 3]')
  assert_not_equal([1;2;3], [1 2 3]')

  assert_equal([1 2 3 4], [[1 2] [3 4]])
  assert_equal([1 2; 3 4], [[1 2]; [3 4]])

  assert_equal([1 2 "a"], [1 2 "a"])
  assert_equal([1,2,3,4,5], [1:5...])

  assert_isa(Array(Int,1,1,1), Array{Int64,3})
end

if is_main()
  UnitTest.run()
end
