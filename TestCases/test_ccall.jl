# test_ccall.jl
#                           wookay.noh at gmail.com

ccall("printf", Void, (Ptr{Uint8},Int64), "hello: %d", 42)
ccall("fflush", Void, (Int,), 0)

ccall("printf", Void, (Ptr{Uint8},), "\n")
