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
msg = "1부터 9까지 서로 다른 $(DIGITS)자리 숫자를 입력하세요"
println("$msg (0: 그만하기)")
while true
  print("입력: ")
  input = chomp(readline())
  0 == length(input) && continue
  "0" == input && break
  guess = map(x->parse(Int,x), split(input, ""))
  if DIGITS == length(guess) &&
     DIGITS == length(unique(guess)) &&
     all(x->x in 1:9, guess)
    if solve(secret, guess)
      println("$(tries)번만에 정답을 맞췄습니다!")
      break
    end
    tries += 1
  else
    println("- $msg")
  end
end
