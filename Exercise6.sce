// Copyright (C) 2021 - UGA - JIANG Yilun
//
// Date of creation: 2021-9-26
//

x1 = [1 1 2 3 3]
y1 = [1 4 3 4 1]

scf()
plot(x1, y1, "-")
plot(x1, y1, ".")
replot([0 0 4 5])

x2 = [1 1 2 3 3]
y2 = [1 4 3 4 1]

x3 = [4 5 6]
y3 = [1 4 1]
x4 = [4.5 5.5]
y4 = [2.5 2.5]

x5 = [7 7]
y5 = [1 4]
x6 = [7 9 9 7]
y6 = [4 4 3 3]

scf()
plot(x1, y1, "-")
plot(x1, y1, ".")

plot(x2, y2, "-")
plot(x2, y2, ".")

plot(x3, y3, "-")
plot(x3, y3, ".")
plot(x4, y4, "-")
plot(x4, y4, ".")

plot(x5, y5, "-")
plot(x5, y5, ".")
plot(x6, y6, "-")
plot(x6, y6, ".")

replot([0 0 10 5])
