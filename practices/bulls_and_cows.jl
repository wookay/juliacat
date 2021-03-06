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
  bulls, cows 
end

function valid_guess(input)
  if DIGITS == length(input) && isdigit(input)
    guess = map(x->parse(Int,x), split(input, ""))
    valid = DIGITS == length(unique(guess)) && all(x->x in 1:9, guess)
    return valid, guess
  else
    return false, []
  end
end

function bulls_and_cows()
  secret = randperm(9)[1:DIGITS]
  # println(secret)
  
  message = "1부터 9까지 서로 다른 $(DIGITS)자리 숫자를 입력하세요"
  
  println("Bulls and Cows")
  println("$message (0: 그만하기)")
  
  tries = 1
  while true
    print("입력: ")
    input = chomp(readline())
    0 == length(input) && continue
    "0" == input && break
    valid, guess = valid_guess(input)
    if valid
      bulls, cows = solve(secret, guess)
      println("$bulls bulls, $cows cows")
      if DIGITS == bulls
        println("$(tries)번만에 정답을 맞췄습니다!")
        break
      end
      tries += 1
    else
      println("- $message")
    end
  end
end

bulls_and_cows()
