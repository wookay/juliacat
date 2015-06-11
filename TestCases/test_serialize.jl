# test_serialize.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_serialize()
  s = IOBuffer()

  serialize(s, true)
  serialize(s, false)
  serialize(s, nothing)
  seek(s, 0)

  assert_equal(true, deserialize(s))
  assert_equal(false, deserialize(s))
  assert_equal(nothing, deserialize(s))

  close(s)
end

if is_main()
  UnitTest.run()
end
