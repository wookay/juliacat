# test_module.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

module A
  module B
    module C
      a = 2
    end
  end
end


function test_module()
  assert_equal(2, A.B.C.a)
end

if is_main()
  UnitTest.run()
end
