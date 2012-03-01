load("../juliacat/UnitTest.j")

begin
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
