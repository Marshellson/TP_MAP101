v1 = 5:1:12
v2 = [linspace(5,14,10) , linspace(13, 1, 7)]
M1 = [ones(2,6), zeros(2,4)]
M2 = [linspace(1, 22, 8); linspace(8, -6, 8); (8:-2:-6)]

A = [ones(1,40)', zeros(1,40)']
M3 = [A A A A A]
disp(v1)
disp(v2)
disp(M1)
disp(M2)
disp(M3)
