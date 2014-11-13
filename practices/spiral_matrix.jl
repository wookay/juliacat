# spiral_matrix.jl
#                           wookay.noh at gmail.com

type 방향은 상하; 좌우 end

o(n,_) = n
동 = 방향은(o, +)
남 = 방향은(+, o)
서 = 방향은(o, -)
북 = 방향은(-, o)

앞(위,치, 방향) = (방향.상하(위, 1), 방향.좌우(치, 1))
function 내부인가(방향, x,y, 크기)
  if o==방향.상하
    ==(+, 방향.좌우) ? 크기 >= y : 0<y
  else
    ==(+, 방향.상하) ? 크기 >= x : 0<x
  end
end

function 소용돌이(크기)
  @assert 크기 >= 2

  동남서북 = [동, 남, 서, 북]
  전환() = push!(동남서북, shift!(동남서북)) |> first

  사각형 = zeros(Int, 크기, 크기)
  방향 = 동
  (위,치) = (1,1)

  for 수 in 1:크기^2
    (x,y) = 앞(위,치, 방향)
    사각형[위,치] = 수
    if 내부인가(방향, x,y, 크기)
    else
      방향 = 전환()
      (x,y) = 앞(위,치, 방향)
    end
    if 0==사각형[x,y]
      (위,치) = x,y
    else
      방향 = 전환()
      (x,y) = 앞(위,치, 방향)
      if 0==사각형[x,y]
        (위,치) = x,y
      else
        break
      end
    end
  end
  사각형
end


@assert [
  1  2  3  4 5;
 16 17 18 19 6;
 15 24 25 20 7;
 14 23 22 21 8;
 13 12 11 10 9] == 소용돌이(5)

소용돌이(5) |> println
