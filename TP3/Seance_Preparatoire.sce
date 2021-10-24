deff("y = f1(x)", "y = x^6 + x^2 + 9*x - 2")

eps = 10^(-4)

scf()
x_1 = -1:eps:1
y_1 = f1(x_1)
plot(x_1, y_1, "b-")


deff("y = f2(x)", "y = (e^x + 10 * x^3 + x - 2)/10")
scf()
x_2 = 0:eps:1
y_2 = f2(x_2)
plot(x_2, y_2, "b-")
