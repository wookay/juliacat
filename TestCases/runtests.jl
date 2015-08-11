# runtests.jl
#                           wookay.noh at gmail.com

IsNotMain = true

for test = split(strip("""
test_any.jl
test_arrays.jl
test_banner.jl
test_base.jl
test_code_generation.jl
test_combinatorics.jl
test_control_flow.jl
test_core.jl
test_dates.jl
test_docs.jl
test_enums.jl
test_fft.jl
test_file.jl
test_floating_point_functions.jl
test_functions.jl
test_goto.jl
test_hangul.jl
test_iteration.jl
test_linarg.jl
test_macro.jl
test_mathematical_operations.jl
test_metaprogramming.jl
test_module.jl
test_mpfr.jl
test_parallel_computing.jl
test_promotion.jl
test_serialize.jl
test_show.jl
test_strings.jl
test_sysinfo.jl
test_throw.jl
test_types_more.jl
test_random.jl
test_ranges.jl
test_reflection.jl
test_set.jl
test_show.jl
test_tuple.jl
test_unicode_mathematical_operators.jl
test_versionnumber.jl
"""), "\n")
  include(test)
end

if VERSION.minor > 3
  for test = split(strip("""
test_irrationals.jl
test_loading.jl
test_types.jl
"""), "\n")
    include(test)
  end
end


ignores = """
test_code_native.jl
test_ccall.jl
test_cxx.jl
test_jump.jl
test_mecab.jl
test_reactive.jl
"""

#UnitTest.run(debug = true)
UnitTest.run()
