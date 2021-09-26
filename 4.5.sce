// Copyright (C) 2021 - UGA - JIANG Yilun
//
// Date of creation: 2021-9-19
//

disp("Exemple 1")

for i = 1:10
    disp(i)
end

disp("Exemple 2")
t = [2.4 7.4 8 3.1 9.5 0.1]
somme_t = 0;
min_t = t(1)
for i = i : length(t)
    v = t(i)
    disp(v)
    somme_t = somme_t + v
    if min_t > v then
        min_t = v
     end
end
mprintf("La somme des elements de tab_v est %f\n", somme_t)
mprintf("Le min . des elements de tab_v est %f\n", min_t)
