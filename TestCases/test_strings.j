# test_strings.j
#                           wookay.noh at gmail.com

load("../juliacat/UnitTest.j")

function test_strings()
  assert_equal(ASCIIString, typeof("A"))
  assert_equal(UTF8String, typeof("한글"))
  assert_equal(Char, typeof('A'))
  assert_equal('A', char(65))
  assert_equal(65, int('A'))

  local str = "Hello world"
  assert_equal('H', str[1])
  assert_equal('d', str[end])
  assert_equal('l', str[end-1])
  assert_equal("He", str[1:2])

  assert_equal("\$str\t", E"$str\t")
  assert_equal("\$str\\t", L"$str\t")
  assert_equal("$str", I"$str")
  assert_equal([65,66], b"AB")

  assert_equal("abc", strcat("a","b","c"))

  const SPACE = " "
  assert_equal(["Hello","world"], split(str, SPACE))
  assert_equal(str, join(["Hello","world"], SPACE))

  const LF = "\n"
  local multilined = """a
b
c"""
  assert_equal(["a","b","c"], split(multilined, LF))
end

if is_main()
  UnitTest.run()
end
