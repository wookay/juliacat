# test_iteration.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_enumerate()
  d = Dict()
  for (idx, el) in enumerate("abc")
    d[idx] = el
  end
  assert_equal(Dict(1=>'a',2=>'b',3=>'c'), d)
end

function test_start_done_next()
  cnt = 0
  I = [1,2,3]
  state = start(I)
  assert_equal(1, state)
  while !done(I, state)
    (i, state) = next(I, state)
    cnt += 1
  end
  assert_equal(3, cnt)
end

function test_zip()
   assert_equal([(1,'a'), (2,'b'), (3,'c')], collect(zip([1,2,3,4,5], "abc")))
end

if is_main()
  UnitTest.run()
end
