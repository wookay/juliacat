# StringExt.j
#                           wookay.noh at gmail.com

global const LF = "\n"
global const SPACE = " "
global const COMMA = ","

macro _u_str(s)
  local sx = []
  local idx = start(s)
  while !done(s, idx)
    local c, k = next(s, idx)
    push(sx, c)
    idx = k
  end
  expr(:call, ()->sx)
  # expr(:call, ()->chars(s))
end

macro _w_str(s)
  expr(:call, ()->split(s, SPACE))
end
