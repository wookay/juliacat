# StringExt.jl
#                           wookay.noh at gmail.com

const LF = "\n"
const SPACE = " "
const COMMA = ","

macro _u_str(s)
  local sx = []
  local idx = start(s)
  while !done(s, idx)
    local c, k = next(s, idx)
    push(sx, c)
    idx = k
  end
  Expr(:call, ()->sx)
  # expr(:call, ()->chars(s))
end

macro _w_str(s)
  Expr(:call, ()->split(s, SPACE))
end
