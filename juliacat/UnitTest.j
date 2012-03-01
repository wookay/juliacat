# UnitTest.j
#                           wookay.noh at gmail.com

function assert_equal(expected, got)
  if isequal(expected, got)
    print("passed: $expected\n")
  else
    print("Assertion failed\nExpected: $expected\nGot: $got\n")
  end
end
