using Base.Test

# Hangul
include("../juliacat/Hangul.jl")

if VERSION.minor > 3 @eval begin

han = hangul_split("한")
@test Any[["ㅎ","ㅏ","ㄴ"]] == han
cho = hangul_chosungs("한")
@test ["ㅎ"] == cho
@test "한" == hangul_join(["ㅎ","ㅏ","ㄴ"])

end end


# ArrayExt
include("../juliacat/ArrayExt.jl")

@test 2 == index([1,5,3], 5)


# UnitTest
include("../juliacat/UnitTest.jl")
