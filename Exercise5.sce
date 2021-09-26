// Copyright (C) 2021 - UGA - JIANG Yilun
//
// Date of creation: 2021-9-25
//

//Exercise 5

a = input("Entrer un entier a: ")
while a <= 0
    disp("a faut superieur a 0")
    a = input("Entrer un entier a: ")
end

u = [0,0,0,0,0,0,0,0,0,0]
for count = 1:10
    if count == 1 then
        u(count) = (a + 1) ./ 2
    else
        u(count) = (a ./ 2 .* (u(count - 1)) + (u(count - 1) ./ 2))
    end
    
end

for temp = 1:10
    disp(u(temp))
end
