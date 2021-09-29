// Copyright (C) 2021 - UGA - JIANG Yilun
//
// Date of creation: 2021-9-15
//

deff("y = f3(x)", "y = log(x + sqrt((x) .^ 2 - 1))")
deff("y = f4(x)", "y = log(x + sqrt((x) .^ 2 + 1))")
deff("y = f5(x)", "y = 1/2 * log((1 + x) ./ (1 - x))")

t = 0:0.2:5

u = f3(cosh(t))
v = f4(sinh(t))
w = f5(tanh(t))

M = [t;u;v;w]'
disp(M)
