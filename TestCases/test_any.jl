# test_any.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_any()
  assert_isa(ANY, TypeVar)
  assert_isa(Any, DataType)
  assert_isa(any, Function)
end

if is_main()
  UnitTest.run()
end
