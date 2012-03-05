# test_all.jl
#                           wookay.noh at gmail.com

for test = split(strip("""
test_arrays.jl
test_metaprogramming.jl
test_control-flow.jl
test_strings.jl
test_functions.jl
test_types.jl
test_mathematical-operations.jl
test_hangul.jl
"""), "\n")
  load(test)
end

UnitTest.run()
