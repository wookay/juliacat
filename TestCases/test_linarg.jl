# test_linarg.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

function test_diagonal()
  assert_equal(eye(Int,3), Diagonal(ones(Int,3,3)))
  twos = ones(Int,3,3)+1
  assert_equal([
    2  0  0
    0  2  0
    0  0  2
  ], Diagonal(twos))
end


# https://en.wikipedia.org/wiki/Hermitian_matrix
function test_hermitian()
  assert_true(ishermitian([2 2+im 4; 2-im 3 im; 4 -im 1]))
end

function test_lu_factorization()
  A = [4 3; 6 3]
  (L, U, p) = lu(A)
  assert_equal([1.0 0.0;4/6 1.0], L)
  assert_equal([6.0 3.0;0.0 1.0], U)
  assert_equal([2, 1], p)

  A = [1 -2 3; 2 -5 12; 0 2 -10]
  (L, U, p) = lu(A)
  assert_equal(
[1.0 0.0 0.0
 0.0 1.0 0.0
 0.5 0.25 1.0], L)
  assert_equal(
[2.0 -5.0 12.0
 0.0 2.0 -10.0
 0.0 0.0 -0.5], U)
  assert_equal([2,3,1], p)
end

if VERSION.minor > 3 @eval begin

function test_tridiagonal()
  n = 5
  z = zeros(Int, n-1)
  assert_equal([0;0;0;0], z)
  assert_equal([1;2;3;4;5], [1:n;])
  assert_equal([
    1  0  0  0  0
    0  2  0  0  0
    0  0  3  0  0
    0  0  0  4  0
    0  0  0  0  5
  ], Tridiagonal(z, [1:n;], z))
end

function test_triangular()
  srand(0)
  assert_equal([
    0.8236475079774124  0.0                  0.0                  0.0                 0.0
    0.9103565379264364  0.042301665932029664 0.0                  0.0                 0.0
    0.16456579813368521 0.06826925550564478  0.26003585026904785  0.0                 0.0
    0.17732884646626457 0.3618283907762174   0.910046541351011    0.9677995536192001  0.0
    0.278880109331201   0.9732164043865108   0.16703619444214968  0.7676903325581188  0.043141023329413164
  ], LowerTriangular(rand(5,5)))
  assert_equal([
    0.2679846344919068  0.838117753907359    0.7670696322682211   0.951690700362799   0.7766742218683131
    0.0                 0.9147120238969264   0.8019235854122897   0.8011185163108001  0.1048226490565447
    0.0                 0.0                  0.035344549147287685 0.12432272872023531 0.8380749803307581
    0.0                 0.0                  0.0                  0.11426876182995338 0.18411485558080476
    0.0                 0.0                  0.0                  0.0                 0.3121451099216308
  ], UpperTriangular(rand(5,5)))
end

end end

if is_main()
  UnitTest.run()
end
