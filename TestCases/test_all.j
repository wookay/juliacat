# test_all.j
#                           wookay.noh at gmail.com

for test = split(strip("""
test_arrays.j
test_metaprogramming.j
test_control-flow.j
test_strings.j
test_functions.j
test_types.j
test_mathematical-operations.j
"""), "\n")
  load(test)
end

UnitTest.run()
