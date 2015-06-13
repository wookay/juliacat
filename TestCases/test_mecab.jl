# test_mecab.jl
#                           wookay.noh at gmail.com

using MeCab

mecab = Mecab("-d /usr/local/Cellar/mecab-ko-dic/1.6.1-20140814")

results = parse(mecab, "밥은 먹고 다니냐")
for result in results
  println(result.surface, ":", result.feature)
end

# 밥:NNG,*,T,밥,*,*,*,*,*
# 은:JX,*,T,은,*,*,*,*,*
# 먹:VV,*,T,먹,*,*,*,*,*
# 고:EC,*,F,고,*,*,*,*,*
# 다니:VV,*,F,다니,*,*,*,*,*
# 냐:EC,*,F,냐,*,*,*,*,*
