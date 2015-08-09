# test_irrationals.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

if VERSION.minor > 3 @eval begin

function test_irrationals()
  assert_isa(pi, Irrational{:π})
end

end end


if is_main()
  UnitTest.run()
end
