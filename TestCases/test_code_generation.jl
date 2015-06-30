# test_code_generation.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

for (f,block) in [
    (:test_code_generation,
     n -> begin
       assert_equal(1, n)
     end)
  ]
  @eval begin
    function $f()
      n = 1
      $block(n)
    end
  end
end

if is_main()
  UnitTest.run()
end
