# score_report.jl
#                           wookay.noh at gmail.com

!(VERSION.minor > 3) && println("Required Julia 0.4")

@enum 과목 국어 영어 수학

type 학생타입
  이름
  성적::Dict
end

function 총점구하기(학생::학생타입)
  학생.성적[국어] + 학생.성적[영어] + 학생.성적[수학]
end

function 평균구하기(학생::학생타입)
  총점구하기(학생) / length(instances(과목))
end

function 학점구하기(학생::학생타입)
  평균 = 평균구하기(학생)
  학점구간 = Dict(
    "F"  => x-> 0  <= x < 60,
    "D"  => x-> 60 <= x < 65,
    "D+" => x-> 65 <= x < 70,
    "C"  => x-> 70 <= x < 75,
    "C+" => x-> 75 <= x < 80,
    "B"  => x-> 80 <= x < 85,
    "B+" => x-> 85 <= x < 90,
    "A"  => x-> 90 <= x < 95,
    "A+" => x-> 95 <= x <= 100)
  for (학점,구간) in 학점구간
    구간(평균) && return 학점
  end
  return "에러"
end

function 성적순으로(학생들)
  sort(학생들, by=총점구하기) |> reverse |> enumerate
end



import Base.cpad
cpad8(x) = cpad(string(x), 8)

println(repeat("=", 65))
print(cpad("이름", 10))
for 과목명 in instances(과목)
  과목명 |> cpad8 |> print
end
"총점" |> cpad8 |> print
"평균" |> cpad8 |> print
"학점" |> cpad8 |> print
"등수" |> cpad8 |> print
println()
println(repeat("=", 65))


학생들 = [
  학생타입("철수", Dict(국어=>70, 영어=>60, 수학=>50))
  학생타입("영희", Dict(국어=>80, 영어=>98, 수학=>80))
  학생타입("성필", Dict(국어=>81, 영어=>50, 수학=>90))
]

for (순위,학생) in 성적순으로(학생들)
  print(cpad(학생.이름, 10))
  for 과목명 in instances(과목)
    학생.성적[과목명] |> cpad8 |> print
  end
  학생 |> 총점구하기 |> cpad8 |> print
  round(평균구하기(학생), 1) |> cpad8 |> print
  학생 |> 학점구하기 |> cpad8 |> print
  순위 |> cpad8 |> print
  println()
end


# =================================================================
#    이름     국어    영어    수학    총점    평균    학점    등수
# =================================================================
#    영희      80      98      80     258     86.0     B+      1
#    성필      81      50      90     221     73.7     C       2
#    철수      70      60      50     180     60.0     D       3
