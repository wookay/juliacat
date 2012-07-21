# test_say.jl
#                           wookay.noh at gmail.com

load("../juliacat/UnitTest.jl")

function test_say()
  외쳐 = x -> print(x)
  외쳐("EE")
end

if is_main()
  UnitTest.run()
end
