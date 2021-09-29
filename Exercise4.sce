disp("Exemple 2")
t = [2.4 7.4 8 3.1 9.5 0.1]
somme_t = 0;
produit_t = 1;
min_t = t(1)
max_t = t(1)
for i = 1:length(t)
    v = t(i)
    disp(v)
    somme_t = somme_t + v;
    w = t(i)
    disp(w)
    produit_t = produit_t * w;

    if min_t>v then
        min_t = v
    end
    if max_t<v then
        max_t = v
    end
end
mprintf("La somme des elements de tab_v est %f\n", somme_t);
mprintf("Le produit des elements de tab_v est %f\n", produit_t);
mprintf("Le min.  des elements de tab_v est %f\n", min_t);
mprintf("Le max.  des elements de tab_v est %f\n", max_t);