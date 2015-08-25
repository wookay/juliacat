using Base.Test

a = split("쥐 소 호랑이 토끼 용 뱀 말 양 원숭이 닭 개 돼지", " ")
for x=1:100
  deux = a[randperm(length(a))[1:2]]
  #println(deux)
  @test deux[1] != deux[2]
end
