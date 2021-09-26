// Copyright (C) 2021 - UGA - JIANG Yilun
//
// Date of creation: 2021-9-15
//

deff("y = f(x)", "y = 1 ./ (1 + x .^ 2)")

x = 0:0.5:10
y = f(x)
disp(y)

t = linspace(-1, 2, 1000)
z = f(t)
disp(z)

deff("y = f1(x)", "y = (1) ./ (1 + x .^ 2)")
deff("y = f2(x)", "y = (x + 1) .^ 2")

x = 0:0.5:10

y = f1(x)
z = f2(x)
