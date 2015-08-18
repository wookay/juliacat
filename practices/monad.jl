!(VERSION.minor > 3) && println("Required Julia 0.4")

type Maybe
  a
end

==(b::Maybe, c::Maybe) = b.a == c.a
bind(b::Maybe, f::Function) = f(b.a)

retur(a) = Maybe(a)
Just(a) = Maybe(a)
Nothin = Maybe(nothing)

using Base.Test
@test Maybe == typeof(Just(ANY))
@test Maybe == typeof(Nothin)
@test Maybe(1) == retur(1)
@test [Maybe] == Base.return_types(retur, Tuple{Any})
@test Just(5) == bind(Just(5), (x) -> Just(x))
@test Just(nothing) == bind(Nothin, (x) -> Just(x))


function maybeHalf(a::Union{Int,Void})
  isa(a, Int) && iseven(a) ? Just(div(a,2)) : Nothin
end

@test Nothin == bind(Nothin, maybeHalf)
@test Just(5) == bind(Just(10), maybeHalf)
@test Nothin == bind(bind(Just(10), maybeHalf), maybeHalf)
@test Nothin == bind(bind(bind(Just(10), maybeHalf), maybeHalf), maybeHalf)
