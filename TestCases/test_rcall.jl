# test_rcall.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

using RCall

function test_rcall()

  reval("""
       f <- function(n) {
         return (n+1)
       }
  """)

  assert_equal(3, rcopy(rcall(:f, 2)))

end

if is_main()
  UnitTest.run()
end
