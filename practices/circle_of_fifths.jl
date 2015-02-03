# circle_of_fifths.jl
#                           wookay.noh at gmail.com

macro _w_str(s)
  Expr(:call, ()->split(s, " "))
end

keys = _w"C F Bb Eb Ab Db Gb B E A D G"
dozenal(a) = a > 12 ? a-12 : a
f(a) = a+5 |> dozenal

a = 0
for key in keys
  println([key a|>f|>f|>f|>f a+1 a|>f a|>f|>f a|>f|>f|>f a|>f|>f|>f|>f])
  a = a|>f|>dozenal
end

# Any["C" 8 1 5 10 3 8]
# Any["F" 1 6 10 3 8 1]
# Any["Bb" 6 11 3 8 1 6]
# Any["Eb" 11 4 8 1 6 11]
# Any["Ab" 4 9 1 6 11 4]
# Any["Db" 9 2 6 11 4 9]
# Any["Gb" 2 7 11 4 9 2]
# Any["B" 7 12 4 9 2 7]
# Any["E" 12 5 9 2 7 12]
# Any["A" 5 10 2 7 12 5]
# Any["D" 10 3 7 12 5 10]
# Any["G" 3 8 12 5 10 3]
