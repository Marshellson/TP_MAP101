##### Sokem AYIGAH, Yilun JIANG et Djamal FECIH			                                       	IMA6
# MAP : Compte Rendu TP1

### Exercice 1

```matlab
# Exercice 1

v1 = 5:1:12;

v2 = [linspace(5,14,10) , linspace(13, 1, 7)];

M1 = [ones(2,6), zeros(2,4)];

M2 = [linspace(1, 22, 8); linspace(8, -6, 8); (8:-2:-6)];

A = [ones(1,40)', zeros(1,40)'];

M3 = [A A A A A];

disp(v1)
disp(v2)
disp(M1)
disp(M2)
disp(M3)
```

### Exercice 2

```matlab
# Exercice 2

M1 = [1:7;3:9;5:11;7:13]';
M2 = [ones(3,2) zeros(3,3); 5*ones(2,2) -2*ones(2,3)];
M3 = [ones(1,8);linspace(1,8,8);linspace(1,8,8)^2];
M4 = [zeros(10,20);ones(10,20); 2*ones(10,20)];

disp(M1)
disp(M2)
disp(M3)
disp(M4)
```

### Exercice 3

```matlab
# Exercice 3

deff("y = f3(x)", "y = log(x + sqrt((x .^ 2) - 1))")
deff("y = f4(x)", "y = log(x + sqrt((x .^ 2) + 1))")
deff("y = f5(x)", "y = 1/2 * log((1 + x) ./ (1 - x))")

t = 0:0.2:5;

u = f3(cosh(t));
v = f4(sinh(t));
w = f5(tanh(t));

M = [t;u;v;w]';
disp(M)
```

#### Explication : 

* On a les fonctions inverses (reciproques) de de tan(x), sinus(x) et cos(x) successivement

![](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/0f143648204b976ae8bea91bdac6130641e2297d.png)

![](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/64f4966b5a6567ed036f23bc91c7c90c9a95c6a1.png)

![](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/6635cf2cd634e3aed74dd520615ff20a72073358.png)

* Alors 

$$
cosh^{-1} (cos(x)) = sinh^{-1} (sin(x)) = tanh^{-1} (tan(x)) = x
$$

* Donc : les quatre colonnes du tableau M sont identiques.

### Exercice 4

```matlab
# Exercice 4

disp("Exemple 2")
t = [2.4 7.4 8 3.1 9.5 0.1]
somme_t = 0;
produit_t = 1;
min_t = t(1)
max_t = t(1)
for i = 1:length(t)
    v = t(i)
    somme_t = somme_t + v;
    disp(somme_t)
    w = t(i)
    produit_t = produit_t * w;
    disp(produit_t)

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
```

### Exercice 5

```matlab
# Exercice 5

a = input("Entrer un entier a > 0 : ")
while a <= 0
    disp("Veuillez entrer une valeur de a superieure à 0")
    a = input("Entrez un entier a : ")
end

u = zeros(1,10)
for count = 1:10
    if count == 1 then
        u(count) = (a + 1) ./ 2
    else
        u(count) = (a ./ (2 .* (u(count - 1))) + (u(count - 1) ./ 2))
    end
    
end

for temp = 1:10
    disp(u(temp))
end
```

### Exercice 6

```matlab
# Exercice 6

x1 = [1 1 2 3 3]
y1 = [1 4 3 4 1]

x2 = [1 1 2 3 3]
y2 = [1 4 3 4 1]

x3 = [4 5 6]
y3 = [1 4 1]
x4 = [4.5 5.5]
y4 = [2.5 2.5]

x5 = [7 7 9 9 7]
y5 = [1 4 4 3 3]

scf()
plot(x1, y1, "-")
plot(x1, y1, ".")
replot([0 0 4 5])

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

replot([0 0 10 5])
```

### Exercice 7

```matlab
# 9eme question de l'exercice 5

deff("y = f12(x)", "y = cos(x)")
deff("y = f13(x)", "y = sin(x)")
deff("y = f14(x)", "y = tan(x)")

scf()
x_9 = -3*%pi/2:eps:3*%pi/2
y_9_1 = f12(x_9)
y_9_2 = f13(x_9)
y_9_3 = f14(x_9)
plot(x_9, y_9_1, "b-")
plot(x_9, y_9_2, "b-")
plot(x_9, y_9_3, "b-")
replot([-3*%pi/2, -4, 3*%pi/2, 4])

axes = gca()
xtitle(["$f(x) = cos(x)$";"$f(x) = sin(x)$"; "$f(x) = tan(x)$"])
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")
```



![1](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/1.png)

![2](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/2.png)

![3](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/3.png)

![4](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/4.png)

![5](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/5.png)

![6](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/6.png)

![7](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/7.png)

![8](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/8.png)

![9](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/9.png)

![10](https://github.com/Marshellson/TP_MAP101/blob/main/TP1/image/10.png)

```matlab
#Exercice 7 (code complet)

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
replot([-2, 0, 2, 4])

axes = gca()
xtitle("$f(x) = x^2$")
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")

scf()
x_2 = -2:eps:2
y_2 = f3(x_2)
plot(x_2, y_2, "b-")
replot([-2, -4, 2, 4])

axes = gca()
xtitle("$f(x) = x^3$")
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")

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

axes = gca()
xtitle(["$f(x) = x$";"$f(x) = x^2$";"$f(x) = x^3$";"$f(x) = x^4$";"$f(x) = x^5$"])
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")

scf()
x_4 = -10:eps:10
y_4 = f6(x_4)
plot(x_4, y_4, "b-")
replot([-10, -10, 10, 10])

axes = gca()
xtitle("$f(x) = 1/x$")
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")

scf()
x_5 = -10:eps:10
y_5 = f7(x_5)
plot(x_5, y_5, "b-")
replot([-10, -10, 10, 10])

axes = gca()
xtitle("$f(x) = |x|$")
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")

scf()
x_6 = -5:eps:5
y_6_1 = f8(x_6)
y_6_2 = f9(x_6)
plot(x_6, y_6_1, "b-")
plot(x_6, y_6_2, "b-")
replot([-5, -5, 5, 5])

axes = gca()
xtitle(["$f(x) = exp(x)$";"$f(x) = ln(x)$"])
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")


scf()
x_7 = 0:eps:10
y_7 = f10(x_7)
plot(x_7, y_7, "b-")

axes = gca()
xtitle("$f(x) = sqrt(x)$")
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")

scf()
a = [1/3 2/5 1/2 2/3 1 3/2 2 5/2 3]
x_8 = -3:eps:3
for i = 1 : length(a)
    y_8 = f11(a(i), x_8)
    plot(x_8, y_8, "b-")
end
replot([-3, 0, 3, 10])

axes = gca()
xtitle("$f(a) = a^x$")
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")

scf()
x_9 = -3*%pi/2:eps:3*%pi/2
y_9_1 = f12(x_9)
y_9_2 = f13(x_9)
y_9_3 = f14(x_9)
plot(x_9, y_9_1, "b-")
plot(x_9, y_9_2, "b-")
plot(x_9, y_9_3, "b-")
replot([-3*%pi/2, -4, 3*%pi/2, 4])

axes = gca()
xtitle(["$f(x) = cos(x)$";"$f(x) = sin(x)$"; "$f(x) = tan(x)$"])
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")

scf()
x_10 = -3:eps:3
y_10_1 = f15(x_10)
y_10_2 = f16(x_10)
y_10_3 = f17(x_10)
plot(x_10, y_10_1, "b-")
plot(x_10, y_10_2, "b-")
plot(x_10, y_10_3, "b-")
replot([-3, -4, 3, 4])

axes = gca()
xtitle(["$f(x) = cosh(x)$";"$f(x) = sinh(x)$"; "$f(x) = tanh(x)$"])
axes.x_location = "origin"
axes.y_location = "origin"
axes.box = "off"
set(axes, "isoview", "on")
```

