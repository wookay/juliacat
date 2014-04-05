# test_hangul_coding.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")
include("hangul_coding.jl")

function test_hangul_coding()
  assert_equal(닿, typeof(ㅎ))
  assert_equal(홀, typeof(ㅏ))
  assert_equal(낱, typeof(ㅎ+ㅏ+ㄴ))
  assert_equal(닿("ㅎ"), ㅎ)
  assert_equal(홀("ㅏ"), ㅏ)
  assert_equal(낱("한"), ㅎ+ㅏ+ㄴ)
  assert_equal("ㅎ", ㅎ.소리)
  assert_equal("ㅏ", ㅏ.소리)
  assert_equal("한", (ㅎ+ㅏ+ㄴ).소리)
  assert_equal("글", (ㄱ+ㅡ+ㄹ).소리)
  assert_equal("이", (ㅇ+ㅣ).소리)
end

if is_main()
  UnitTest.run()
end
