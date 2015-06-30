# test_show.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_show()
  buf = IOBuffer() 

  xdump(buf, ANY)
  assert_equal("TypeVar \n  name: Symbol ANY\n  lb: Union{}\n  ub: Any::DataType  <: Any\n  bound: Bool false\n", takebuf_string(buf))

  xdump(buf, Any)
  assert_equal("Any\n", takebuf_string(buf))

  close(buf)
end

if is_main()
  UnitTest.run()
end
