# test_strings.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_strings()
  assert_equal(ASCIIString, typeof("A"))
  assert_equal(UTF8String, typeof("한글"))
  assert_equal(Char, typeof('A'))
  assert_equal('A', Char(65))
  assert_equal(65, Int('A'))

  local str = "Hello world"
  assert_equal('H', str[1])
  assert_equal('d', str[end])
  assert_equal('l', str[end-1])
  assert_equal("He", str[1:2])

  assert_equal([0x41,0x42], b"AB")

  assert_equal("abc", string("a","b","c"))

  const SPACE = " "
  assert_equal(["Hello","world"], split(str, SPACE))
  assert_equal(str, join(["Hello","world"], SPACE))

  const LF = "\n"
  local multilined = """a
b
c"""
  assert_equal(["a","b","c"], split(multilined, LF))

  assert_equal("abc", *("a", "b", "c"))

  +(s::String...) = join(s)
  assert_equal("ab", "a" + "b")
  assert_equal("abc", +("a", "b", "c"))
end

function test_regex()
  m = match(r"(?P<hour>\d+):(?P<minute>\d+)","12:45") 
end

if is_main()
  UnitTest.run()
end
