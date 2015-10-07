# test_sysinfo.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

if VERSION.minor > 3 @eval begin

function test_sysinfo()
  @windows ? () : (
    assert_true(endswith(Sys.get_process_title(), "julia"))
  )
end

end end

if is_main()
  UnitTest.run()
end
