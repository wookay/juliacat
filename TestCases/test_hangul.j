# test_hangul.j
#                           wookay.noh at gmail.com

load("../juliacat/UnitTest.j")
load("../juliacat/StringExt.j")
load("../juliacat/ArrayExt.j")
load("../juliacat/Hangul.j")

function test_hangul()
  local han = hangul_split("한")
  assert_equal({{"ㅎ","ㅏ","ㄴ"}}, han)

  local cho = hangul_chosungs("한")
  assert_equal({"ㅎ"}, cho)

  assert_equal("한", hangul_join({"ㅎ","ㅏ","ㄴ"}))
end

if is_main()
  UnitTest.run()
end
