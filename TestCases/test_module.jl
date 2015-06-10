# test_module.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

module M
  module A
    module B
      c = 2
    end
  end
end


function test_module()
  assert_equal(2, M.A.B.c)
end

if is_main()
  UnitTest.run()
end
