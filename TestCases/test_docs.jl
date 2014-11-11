# test_docs.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

using .Docs

@doc """
`test_docs()`: docs 테스트
""" ->
function test_docs()
  assert_equal("test_docs()", doc(test_docs)[1].content[1].content[1].code)
  assert_equal(": docs 테스트", doc(test_docs)[1].content[1].content[2])
end

if is_main()
  UnitTest.run()
end
