# circle_of_fifth.jl
#                           wookay.noh at gmail.com

macro _w_str(s)
  Expr(:call, ()->split(s, " "))
end

keys = _w"C F Bb Eb Ab Db Gb B E A D G"
dozenal(a) = a > 12 ? a-12 : a
f(a) = a+5 |> dozenal

a = 0
for key in keys
  println([key a|>f|>f|>f|>f a|>f|>f|>f a|>f|>f a|>f a+1 a|>f|>f|>f|>f])
  a = a|>f|>dozenal
end
