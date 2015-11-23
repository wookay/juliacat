using Base.Test
plus(a,b) = a+b
@test 31 == plus(15,16)
@code_llvm plus(15,16)
@test 31 == Base.llvmcall("""
%3 = add i64 %1, %0
ret i64 %3
""", Int, Tuple{Int,Int}, 15, 16)
