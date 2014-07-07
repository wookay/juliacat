# 코멘트

type Customer
  현금::Int
  적립포인트::Int
end

현구 = Customer(10000, 0)

현구.현금 += 50000


function tax(price)
  0.1 * price
end

function earn(pay)
  0.02 * pay
end

아메리카노 = 4000
에스프레소 = 5000

금액 = 2아메리카노 + 3에스프레소
부가세 = tax(금액)
부가세포함가격 = 금액 + 부가세

적립 = earn(부가세포함가격)

현구.현금 -= 부가세포함가격
현구.적립포인트 += 적립

println("현금:  $(현구.현금)")
println("적립포인트:  $(현구.적립포인트)")
