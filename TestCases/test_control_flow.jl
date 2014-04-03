# test_control_flow.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_control_flow()
  assert_equal(1:5, 1:5)

  function producer()
    for n = 1:3
      produce(2n)
    end
  end

  local p = Task(producer)
  assert_equal(2, consume(p))
  assert_equal(4, consume(p))
  assert_equal(6, consume(p))
  assert_equal(nothing, consume(p))
end

if is_main()
  UnitTest.run()
end
