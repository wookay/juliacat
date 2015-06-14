# bulls_and_cows.jl
#                           wookay.noh at gmail.com
#
# https://en.wikipedia.org/wiki/Bulls_and_Cows

DIGITS = 4

function solve(secret, guess)
  bulls, cows = 0, 0
  for (idx, number) in guess |> enumerate
    if number == secret[idx]
      bulls += 1
    elseif number in secret
      cows += 1
    end
  end
  println("$bulls bulls, $cows cows")
  DIGITS == bulls
end


secret = randperm(9)[1:DIGITS]
# println(secret)

tries = 1
println("Bulls and Cows")
println("$DIGITS 자리 숫자를 입력하세요 (0: 그만하기)")
while true
  print("입력: ")
  input = chomp(readline())
  0 == length(input) && continue
  "0" == input && break
  guess = map(x->parse(Int,x), split(input, ""))
  if DIGITS == length(guess) && DIGITS == length(unique(guess))
    if solve(secret, guess)
      println("$tries번만에 $(secret |> join)를 맞췄습니다!")
      break
    end
    tries += 1
  else
    println("- $DIGITS 자리의 다른 숫자를 입력하세요.")
  end
end
