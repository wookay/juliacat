# test_unicode_mathematical_operators.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_unicode_mathematical_operators()
  assert_equal(⋅, dot)
  assert_equal(×, cross)

  x = 2
  itr = [1,2,3]
  assert_equal(∈, in)
  assert_equal(true, ∈(x, itr))
  assert_equal(∉(x, itr), !∈(x, itr))
  assert_equal(∋(itr, x), ∈(x, itr))
  assert_equal(∌(itr, x), !∋(itr, x))

  l = Set([1,2])
  r = Set([1,2,3])
  assert_equal(⊆, issubset)
  assert_equal(⊈(l, r), !⊆(l, r))
  assert_equal(⊊(l, r), <(l, r))
  assert_equal(⊊(l, r), (length(l) < length(r)) && ⊆(l, r))
  assert_equal(Set([1,2]), ∩(l, r))
  assert_equal(Set([1,2,3]), ∪(l, r))
  
  assert_equal(√, sqrt)
  assert_equal(∛, cbrt)
end

if is_main()
  UnitTest.run()
end
