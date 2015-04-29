# test_sysinfo.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_sysinfo()
   assert_equal("julia", Sys.get_process_title())
end

if is_main()
  UnitTest.run()
end
