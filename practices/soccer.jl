# http://todayhumor.com/?programmer_12783

INPUT = """
TIM Cup,15-08-13,AC 밀란,1-1,US 사수올로 칼초
TIM Cup,15-08-13,인터 밀란,1-2,AC 밀란
Audi Cup,15-08-06,AC 밀란,0-2,토트넘 홋스퍼 FC
Audi Cup,15-08-05,FC 바이에른 뮌헨,3-0,AC 밀란
GICC,15-07-30,레알 마드리드 CF,0-0,AC 밀란
GICC,15-07-25,AC 밀란,1-0,인터밀란
INT CF,15-07-19,올랭피크 리옹,2-1,AC 밀란"""

type Team
  name::String
  score::Int
end

const TargetTeam = "AC 밀란"
println(join(["" "" "" "득점" "실점" ""], "\t"))
for line in split(INPUT, "\n")
  cup,date,teama,score,teamb = split(line, ",")
  scorea,scoreb = map(parse, split(score, "-"))
  if teama==TargetTeam
    a,b = Team(teama, scorea), Team(teamb, scoreb)
  elseif teamb==TargetTeam
    a,b = Team(teamb, scoreb), Team(teama, scorea)
  else
    throw(ErrorException("못찾음"))
  end
  println(join([date a.name a.score -b.score b.name], "\t"))
end

#                         득점   실점   
# 15-08-13        AC 밀란 1      -1     US 사수올로 칼초
# 15-08-13        AC 밀란 2      -1     인터 밀란
# 15-08-06        AC 밀란 0      -2     토트넘 홋스퍼 FC
# 15-08-05        AC 밀란 0      -3     FC 바이에른 뮌헨
# 15-07-30        AC 밀란 0      0      레알 마드리드 CF
# 15-07-25        AC 밀란 1      0      인터밀란
# 15-07-19        AC 밀란 1      -2     올랭피크 리옹
