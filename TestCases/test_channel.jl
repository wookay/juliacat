# test_any.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_channel()
  c = Channel()
  assert_equal(false, isready(c))

  put!(c, 1)
  put!(c, "a")

  assert_equal(1, fetch(c))
  assert_equal(1, fetch(c))

  assert_equal(1, take!(c))
  assert_equal("a", take!(c))

  close(c)
  assert_equal(false, isready(c))
end

if is_main()
  UnitTest.run()
end
