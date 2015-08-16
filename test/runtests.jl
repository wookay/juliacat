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
module AModule
end
@loading AModule
show_backtrace()
block = quote
  assert_equal(1, 2)
  assert_equal(1, 1)
  assert_equal(1.0, 1.0)
  assert_not_equal(1, 2)
  assert_true(true)
  assert_false(false)
  assert_isa(1, Int)
  assert_true(is_main())
end
UnitTest.dot_if_passed = true
eval(block)
UnitTest.dot_if_passed = false
eval(block)
UnitTestBase(runner,true,0,0).run()
UnitTestBase(runner,false,0,0).run()
