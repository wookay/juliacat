# test_reactive.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

# https://github.com/JuliaLang/Reactive.jl

try
  Pkg.installed("Reactive")
catch
  Pkg.add("Reactive")
end

@loading Reactive

function test_reactive()
  a = Input(10)
  assert_isa(a, Reactive.Input{Int})
end

if is_main()
  UnitTest.run()
end
