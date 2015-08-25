!(VERSION.minor > 3) && println("Required Julia 0.4")

using Base.Test

@test (|) == (()=>|)[2]
@test (|) == (()->|)()
