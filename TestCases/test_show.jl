# test_show.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_show()
  buf = IOBuffer() 

if VERSION.minor > 3
  xdump(buf, ANY)
  assert_equal("TypeVar \n  name: Symbol ANY\n  lb: Union{}\n  ub: Any::DataType  <: Any\n  bound: Bool false\n", takebuf_string(buf))

  xdump(buf, Any)
  assert_equal("Any\n", takebuf_string(buf))
else
  xdump(buf, ANY)
  assert_equal("""TypeVar 
  name: Symbol ANY
  lb: None
  ub: Any::DataType  <: Any
""", takebuf_string(buf))
end

  close(buf)
end

if is_main()
  UnitTest.run()
end
