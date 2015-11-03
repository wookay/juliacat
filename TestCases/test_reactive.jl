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
  n = Input(100)
  assert_isa(n, Reactive.Input{Int})
  assert_equal(100, value(n))
	push!(n, 5)
  assert_equal(5, value(n))

	double = lift(x->2x, n)
  assert_isa(double, Reactive.Lift{Int})
  assert_equal(5, value(n))
  assert_equal(10, value(double))

	push!(n, 15)
  assert_equal(15, value(n))
  assert_equal(30, value(double))
end

if is_main()
  UnitTest.run()
end
