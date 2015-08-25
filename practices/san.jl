# 算
# http://pgr21.com/pb/pb.php?id=freedom&no=58557

import Base: *

正 = +
負 = -
密率 = pi
正弦 = sin
餘弦 = cos
正切 = tan
餘切 = cot
正割 = sec
如割 = csc
正矢(x) = 1 - 餘弦(x)
度 = deg2rad

using Base.Test
@test 3 == 正(1, 2)
@test 7 == 負(8, 1)

*(i::Int, f::Function) = f(i)
@test isapprox(正切(45度), 1)
