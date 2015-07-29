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
  assert_equal([1 2;], [1 2])
  assert_equal([1;], [1])

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

function test_comprehensions()
  A = [i*j for i=1:9, j=2:9]

  assert_equal([
  2   3   4   5   6   7   8   9
  4   6   8  10  12  14  16  18
  6   9  12  15  18  21  24  27
  8  12  16  20  24  28  32  36
 10  15  20  25  30  35  40  45
 12  18  24  30  36  42  48  54
 14  21  28  35  42  49  56  63
 16  24  32  40  48  56  64  72
 18  27  36  45  54  63  72  81
], A) # 9x8 Array{Int64,2}

  assert_equal([
  2
  4
  6
  8
 10
 12
 14
 16
 18
], A[:,1]) # 9-element Array{Int64,1}

  assert_equal([
  2   3
  4   6
  6   9
  8  12
 10  15
 12  18
 14  21
 16  24
 18  27
], A[:,1:2]) # 9x2 Array{Int64,2}
  
  assert_equal([
 2  3  4  5  6  7  8  9
], A[1,:]) # 1x8 Array{Int64,2}

  assert_equal([
 2  3  4   5   6   7   8   9
 4  6  8  10  12  14  16  18
], A[1:2,:]) # 2x8 Array{Int64,2}

end

if is_main()
  UnitTest.run()
end
