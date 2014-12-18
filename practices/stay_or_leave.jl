# julia version of https://github.com/eungju/kata/blob/master/tools/stay_or_leave.hs
#
# julia stay_or_leave.jl

stayOrLeave(stayDays) = rand(1)[1] < 100/stayDays ? :Leave : :Stay
factor = ARGS |> length ==(1) ? ARGS[1] |> int : 365
decision = stayOrLeave(factor)
"You should $(decision |> string |> lowercase)." |> println
