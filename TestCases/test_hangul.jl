# test_hangul.jl
#                           wookay.noh at gmail.com

load("../juliacat/UnitTest.jl")
load("../juliacat/StringExt.jl")
load("../juliacat/ArrayExt.jl")
load("../juliacat/Hangul.jl")

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
