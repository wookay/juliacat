
# https://www.youtube.com/watch?t=35&v=26dkbH2Dq8U

module Calculator

export Addition, Subtraction, Multiplication, Division, calculate

abstract Calculation
type Addition <: Calculation end
type Subtraction <: Calculation end
type Multiplication <: Calculation end
type Division <: Calculation end

calculate(::Type{Addition}, a, b) = +(a,b)
calculate(::Type{Subtraction}, a, b) = -(a,b)
calculate(::Type{Multiplication}, a, b) = *(a,b)
calculate(::Type{Division}, a, b) = /(a,b)
calculate(f::Function, a, b) = f(a,b)

end


using Calculator
using Base.Test
@test 15 == calculate(Addition, 11, 4)
@test 10 == calculate(Subtraction, 11, 1)
@test 22 == calculate(Multiplication, 11, 2)
@test 5 == calculate(Division, 20, 4)

@test 15 == calculate((a,b)->a+b, 11, 4)
@test 10 == calculate((a,b)->a-b, 11, 1)
@test 22 == calculate((a,b)->a*b, 11, 2)
@test 5 == calculate((a,b)->a/b, 20, 4)
