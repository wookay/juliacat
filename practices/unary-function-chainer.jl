# http://www.codewars.com/kata/unary-function-chainer
# http://stackoverflow.com/questions/28713934/how-to-implement-unary-function-chainer-using-python

f1 = (x) -> x*2
f2 = (x) -> x+2
f3 = (x) -> x^2

chained(funcs) = reduce((f,g)->(n)->n|>f|>g, funcs)

@assert 4 == chained([f1 f2 f3])(0)
@assert 36 == chained([f1 f2 f3])(2)
@assert 12 == chained([f3 f2 f1])(2)
