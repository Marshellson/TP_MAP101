// Copyright (C) 2021 - UGA - JIANG Yilun
//
// Date of creation: 2021-9-28
//

deff("y = f1(x)", "y = x")
deff("y = f2(x)", "y = x^2")
deff("y = f3(x)", "y = x^3")
deff("y = f4(x)", "y = x^4")
deff("y = f5(x)", "y = x^5")
deff("y = f6(x)", "y = 1 ./ x")
deff("y = f7(x)", "y = abs(x)")
deff("y = f8(x)", "y = exp(x)")
deff("y = f9(x)", "y = ln(x)")

eps = 10 ^ (-2)

scf()

x_1 = -2:eps:2
y_1 = f2(x_1)
plot(x_1, y_1, "b-")
replot([-2, -4, 2, 4])

scf()

x_2 = -2:eps:2
y_2 = f3(x_2)
plot(x_2, y_2, "b-")
replot([-2, -4, 2, 4])

scf()

x_3 = 0:eps:1
y_3_1 = f1(x_3)
y_3_2 = f2(x_3)
y_3_3 = f3(x_3)
y_3_4 = f4(x_3)
y_3_5 = f5(x_3)
plot(x_3, y_3_1, "b-")
plot(x_3, y_3_2, "b-")
plot(x_3, y_3_3, "b-")
plot(x_3, y_3_4, "b-")
plot(x_3, y_3_5, "b-")
replot([0, 0, 1, 1])

scf()
x_4 = -10:eps:10
y_4 = f6(x_4)
plot(x_4, y_4, "b-")
replot([-10, -10, 10, 10])

scf()
x_5 = -10:eps:10
y_5 = f7(x_5)
plot(x_5, y_5, "b-")
replot([-10, -10, 10, 10])

scf()
x_6_1 = -5:eps:5
y_6_1 = f8(x_6_1)
x_6_2 = -5:eps:5
y_6_2 = f9(x_6_2)
plot(x_6_1, y_6_1, "b-")
plot(x_6_2, y_6_2, "b-")
replot([-5, -5, 5, 5])