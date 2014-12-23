# test_cxx.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

# https://github.com/Keno/Cxx.jl
using Cxx

cxx"""

#include <iostream>

class A {
  public:
    int num;

    A() {
      num = 5;
    }

    void show() {
      std::cout << "num: " << num << "\n";
    }
};

class B : public A {
  public:
    void add(int n) {
      num += n;
    }
};

"""

function test_cxx()
  a = @cxxnew A()  
  assert_equal(5, @cxx a->num)

  # @cxx a->show()

  b = @cxxnew B()
  assert_equal(5, @cxx b->num)

  @cxx b->add(2)
  assert_equal(7, @cxx b->num)
end

if is_main()
  UnitTest.run()
end
