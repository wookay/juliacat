# test_all.jl
#                           wookay.noh at gmail.com

IsNotMain = true

for test = split(strip("""
test_arrays.jl
test_metaprogramming.jl
test_control_flow.jl
test_strings.jl
test_functions.jl
test_types.jl
test_mathematical_operations.jl
test_hangul.jl
test_parallel_computing.jl
"""), "\n")
  include(test)
end

UnitTest.run()
