// Copyright (C) 2021 - UGA - JIANG Yilun
//
// Date of creation: 2021-9-25
//
// d´efinition de f 

deff(" y = f(x)" , " y = 1 ./ x;" ); // espace entre 1 et ./

eps = 10^( -8);

scf();

// trac´e sur [-6,0[ <=> trac´e sur [-6,0-eps] 
xt = linspace (-6,0-eps ,1000); 
yt = f(xt); 
plot(xt ,yt ," b-" );

// trac´e sur ]0,6] <=> trac´e sur [0+eps ,6] 
xt = linspace (0+eps ,6 ,1000); 
yt = f(xt); 
plot(xt ,yt ," b-" );

axes = gca (); // l’objet ’repere -axes ’ 
replot ([-6 -6 6 6]); // modifier les bornes du repere 
xtitle(" f(x) = 1/x" ) // ajouter un titre au graphique 
axes.x_location = " origin" ; // repere -axes passant par l’origine 
axes.y_location = " origin" ; 
axes.box = " off" ; // supprimer la boite englobant le repere-axes 
set(axes ," isoview " ," on" ) // normaliser le repere
