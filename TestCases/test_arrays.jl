# test_arrays.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_arrays_basic_functions()
  assert_equal(1, ndims([1,2,3]))
  assert_equal((3,), size([1,2,3]))
  assert_equal(Int, eltype([1,2,3]))
  #assert_equal(3, numel([1,2,3]))
  assert_equal(3, length([1,2,3]))
  #assert_equal(3, nnz([1,2,3,0]))

  assert_equal([1 3;2 4], reshape(1:4, 2, 2))
  assert_equal(2, ndims(reshape(1:9, 3, 3)))

  assert_equal([1, 2, 3], push!([1, 2], 3))
  assert_equal(3, pop!([1, 2, 3]))

  assert_equal([1 2 "a"], [1 2 "a"])
  assert_equal([1 2], [1 2])
  try
    [1 2 "a"]
  catch err
    assert_equal("no promotion exists for Int64 and ASCIIString", string(err))
  end

  assert_equal([1,2,3,4,5], [1:5])
end

if is_main()
  UnitTest.run()
end
