# test_sparse.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_sparse()
  spz = sparse(zeros(3,3))
  assert_equal([], spz.nzval)
  assert_equal(zeros(3,3), full(spz))

  spo = sparse(ones(3,3))
  assert_equal(ones(9), spo.nzval)
  assert_equal(ones(3,3), full(spo))
end

if is_main()
  UnitTest.run()
end
