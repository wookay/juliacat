# test_dates.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

if VERSION.minor > 3 @eval begin

function test_dates()
  assert_equal(Date(2015,1,6), Date(2014,12,28) + Dates.Day(9))
  assert_equal(Dates.Day(9), Date(2015,1,6) - Date(2014,12,28))
end

function test_monday_to_friday()
  day = Date(2015,8,7)
  monday = Dates.firstdayofweek(day)
  assert_true(Dates.ismonday(monday))
  assert_equal(Date(2015,8,3):Date(2015,8,7), monday:Dates.tonext(monday, Dates.Fri))
end

end end



if is_main()
  UnitTest.run()
end
