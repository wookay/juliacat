# Hangul.jl
#                           wookay.noh at gmail.com


if VERSION.minor == 3
  abstract AbstractString
end

if isdefined(:SPACE)
else
  include("StringExt.jl")
end

const EMPTY = ""
const Chosungs = _w"ㄱ ㄲ ㄴ ㄷ ㄸ ㄹ ㅁ ㅂ ㅃ ㅅ ㅆ ㅇ ㅈ ㅉ ㅊ ㅋ ㅌ ㅍ ㅎ"
const Jungsungs = _w"ㅏ ㅐ ㅑ ㅒ ㅓ ㅔ ㅕ ㅖ ㅗ ㅘ ㅙ ㅚ ㅛ ㅜ ㅝ ㅞ ㅟ ㅠ ㅡ ㅢ ㅣ"
const Jongsungs = vcat([EMPTY], _w"ㄱ ㄲ ㄳ ㄴ ㄵ ㄶ ㄷ ㄹ ㄺ ㄻ ㄼ ㄽ ㄾ ㄿ ㅀ ㅁ ㅂ ㅄ ㅅ ㅆ ㅇ ㅈ ㅊ ㅋ ㅌ ㅍ ㅎ")
const ChosungOffset = 21 * 28
const JungsungOffset = 28
const Ga = 0xAC00
const Hih = 0xD7A3

function hangul_split_uchar(uchar)
  local n = Int(uchar)
  if n >= Ga && n <= Hih
    n = n - Ga
    local n1 = round(Int, n / ChosungOffset) + 1
    n = n % ChosungOffset
    local n2 = round(Int, n / JungsungOffset) + 1
    local n3 = round(Int, n % JungsungOffset) + 1
    return [ Chosungs[n1], Jungsungs[n2], Jongsungs[n3] ]
  else
    return [ uchar ]
  end
end

function hangul_split(str::AbstractString)
  local ary = []
  for uchar = str
    push!(ary, hangul_split_uchar(uchar))
  end
  return ary
end

function hangul_chosungs(str::AbstractString)
  local ary = []
  for uchar = str
    local t = hangul_split_uchar(uchar)
    push!(ary, t[1])
  end
  return ary
end

function index(a, x)
  findin(a, [x])[1]
end

function hangul_join(ary)
  cho, jung, jong = ary[1], ary[2], ary[3]
  local uch = Ga +
    (index(Chosungs, cho) - 1) * ChosungOffset +
    (index(Jungsungs, jung) - 1) * JungsungOffset +
    (index(Jongsungs, jong) - 1)
  return string(Char(uch))
end
