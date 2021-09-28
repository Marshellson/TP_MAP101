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
deff("y = f9(x)", "y = log(x)")
deff("y = f10(x)", "y = sqrt(x)")
deff("y = f11(a, x)", "y = a ^ x")
deff("y = f12(x)", "y = cos(x)")
deff("y = f13(x)", "y = sin(x)")
deff("y = f14(x)", "y = tan(x)")
deff("y = f15(x)", "y = cosh(x)")
deff("y = f16(x)", "y = sinh(x)")
deff("y = f17(x)", "y = tanh(x)")


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
x_6 = -5:eps:5
y_6_1 = f8(x_6)
y_6_2 = f9(x_6)
plot(x_6, y_6_1, "b-")
plot(x_6, y_6_2, "b-")
replot([-5, -5, 5, 5])

scf()
x_7 = 0:eps:10
y_7 = f10(x_7)
plot(x_7, y_7, "b-")

scf()
a = [1/3 2/5 1/2 2/3 1 3/2 2 5/2 3]
x_8 = -3:eps:3
for i = 1 : length(a)
    y_8 = f11(a(i), x_8)
    plot(x_8, y_8, "b-")
end
replot([-3, 0, 3, 10])

scf()
x_9 = -3*%pi/2:eps:3*%pi/2
y_9_1 = f12(x_9)
y_9_2 = f13(x_9)
y_9_3 = f14(x_9)
plot(x_9, y_9_1, "b-")
plot(x_9, y_9_2, "b-")
plot(x_9, y_9_3, "b-")
replot([-3*%pi/2, -4, 3*%pi/2, 4])

scf()
x_10 = -3:eps:3
y_10_1 = f15(x_10)
y_10_2 = f16(x_10)
y_10_3 = f17(x_10)
plot(x_10, y_10_1, "b-")
plot(x_10, y_10_2, "b-")
plot(x_10, y_10_3, "b-")
replot([-3, -4, 3, 4])