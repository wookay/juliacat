# circle_of_fifths.jl
#                           wookay.noh at gmail.com

# 5도권
# http://guzene.tistory.com/64

macro _w_str(s)
  Expr(:call, ()->split(s, " "))
end

keys = _w"C F Bb Eb Ab Db Gb B E A D G"
dozenal(a) = a >= 12 ? a-12 : a
f(a) = a+5 |> dozenal

a = 0
for key in keys
  println([key a|>f|>f|>f|>f a|>f|>f|>f a|>f|>f a|>f a+1 a|>f|>f|>f|>f])
  a = a|>f|>dozenal
end

# Any["C" 8 3 10 5 1 8]
# Any["F" 1 8 3 10 6 1]
# Any["Bb" 6 1 8 3 11 6]
# Any["Eb" 11 6 1 8 4 11]
# Any["Ab" 4 11 6 1 9 4]
# Any["Db" 9 4 11 6 2 9]
# Any["Gb" 2 9 4 11 7 2]
# Any["B" 7 2 9 4 12 7]
# Any["E" 0 7 2 9 5 0]
# Any["A" 5 0 7 2 10 5]
# Any["D" 10 5 0 7 3 10]
# Any["G" 3 10 5 0 8 3]
