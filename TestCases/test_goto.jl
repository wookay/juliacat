# test_goto.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_goto()
  money = 1000

  function drink()
    # print("$money ")
    money -= rand(10:100)
  end

  @label pub
    drink()
    if money <= 0
      @goto home
    end

  @goto pub

  @label home
    assert_true(money <= 0)
end

if is_main()
  UnitTest.run()
end
