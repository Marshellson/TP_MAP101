// Copyright (C) 2021 - UGA - JIANG Yilun
//
// Date of creation: 2021-10-12
//

///////////////////////////////////////////////////////////////////////////////
// 
// NOMBRES EN INFORMATIQUE
//
// IMPORTANT : ne pas modifier ce fichier
// 
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// test si la chaine de caracteres s est formee uniquement de "0" et/ou "1"
// Entree : s = chaine de caracteres
// Sortie : r = booleen
function r = is_string_01(s)
    r = %t
    k = 1
    while k<=length(s) & r
        c = part(s,k);
        r = (c=="0")|(c=="1") 
        k=k+1
    end
endfunction

///////////////////////////////////////////////////////////////////////////////
// ecriture du nombre entier positif n sur p chiffres binaires
// Entree : n = nombre entier entre 0 et 2^p-1
//          p = nombre entier entre 1 et 52
// Sortie : sp = chaine de p caracteres '0' et/ou '1' 
function sp = entier_vers_codage(n,p)
    // test des parametres en entree
    if type(n)~=1 then
        error("n doit etre une valeur numerique")
    end
    if length(n)~=1 then
        error("n doit etre un scalaire et non pas un tableau")
    end
    
    if type(p)~=1 then
        error("p doit etre une valeur numerique")
    end
    if length(p)~=1 then
        error("p doit etre un scalaire et non pas un tableau")
    end
    
    // convertir p en entier et tester la valeur
    p = floor(p);
    if p<1 | p>52 then
        error("p doit entre 1 et 52")
    end
    
    // convertir n en entier et tester la valeur
    n = floor(n)
    if n<0 | n>2^p-1 then
        error(sprintf("n doit etre entre 0 et %1.0f", 2^p-1))
    end
    
    // construire la chaine de caracteres sp
    sp="";
    for i=1:p
        r = modulo(n,2);
        n = floor(n/2);
        if r==0 then
            sp = "0"+sp;
        else
            sp = "1"+sp;
        end
    end
    
endfunction

///////////////////////////////////////////////////////////////////////////////
// valeur du nombre dont l'ecriture binaire est s
// Entree : s = chaine de caracteres '0' et/ou '1'
// Sortie : v = valeur entiere correspondante
function v = codage_vers_entier(s)
    // test des parametres en entree
    if type(s)~=10 then
        error("s doit etre une chaine de caracteres")
    end
    if prod(size(s))~=1 then
        error("s doit etre une chaine de caracteres unique")
    end
    if ~is_string_01(s) then
        error("s doit etre composee uniquement de ""0"" ou de ""1""")
    end
    
    // calcul de v
    v = 0;
    for k=1:length(s)
        c = part(s,k)
        if c=="0" then
            v=v*2;
        else
            v=v*2+1;
        end
    end
endfunction

/////////////////////////////////////////////////////////////////////////////
// codage du reel flottant v au format binaire 64 chiffres binaires
// Entree : v = reel, ou %inf ou -%inf ou %nan
// Sortie : s = nombre entier entre 0 et 1      (signe)
//          e = nombre entier entre 0 et 2^11-1 (exposant)
//          m = nombre entier entre 0 et 2^11-1 (mantisse)
function [s,e,m] = reel_vers_codage64(v)
    // test des parametres en entree
    if type(v)~=1 then
        error("v doit etre une valeur numerique")
    end
    if length(v)~=1 then
        error("v doit etre un scalaire et non pas un tableau")
    end
    
    // cas Not A Number (%nan)
    if isnan(v) then
        s = 0;
        e = 2^11-1;
        m = 2^51;
        return
    end
    
    // cas infini (%inf ou -%inf)
    if isinf(v) then
        if v<0 then
            s = 1;
        else
            s = 0;
        end
        e = 2^11-1;
        m = 0;
        return
    end
    
    //-- v est une valeur reelle --//
    
    // le signe
    if v<0 then
        s = 1;
        v = -v; // remplacer v par sa valeur absolue
    else
        s = 0;
    end
    
    // cas v < 2^(-1022)
    if v<2^(-1022) then
        e = 0;
        
        // multiplier v par 2^(1074)
        v = v*2^(1000);
        v = v*2^(74);
        m = v
        return;
    end
    
    // cas v >= 2^(-1022)
    // recherche de l'entier p tel que 1 <= v*2^(p) < 2
    // et remplacer v par v/2^(p)
    p=0;
    while v>=2
        p=p+1;
        v=v/2;
    end
    while v<1
        p=p-1;
        v=v*2;
    end
    e = p+1023
    m = floor((v-1)*2^(52))
        
endfunction 


//////////////////////////////////////////////////////////////////////////////
// AJOUT 2021-2022
// test si la valeur d nommee sd est une chaine de n caracteres ou un entier
// entre 0 et 2^n-1
function val_d = conformite_valeur_reel64(d,sd,n)
    if type(d)==10 then
        // d est une chaine de caractere
        if prod(size(d))~=1 then
            error(sd + " doit etre une chaine de caracteres unique")
        end
        if length(d)~=n then
            error(msprintf("%s doit etre une chaine de %d caractere(s)", sd, n))
        end
        if ~is_string_01(d) then
            error(sd+" doit etre composee uniquement de ""0"" ou de ""1""")
        end
        val_d = codage_vers_entier(d);
    elseif type(d)==1 then
        // d est une valeur numerique
        if prod(size(d))~=1 then
            error(sd + " doit etre une valeur unique")
        end
        if d-floor(d)>0 then
            error(sd + " doit etre un nombre entier")
        end
        if d<0 | d>=2^n then
            error(msprintf("%s doit etre un nombre entre 0 et 2^%d-1=%.0f", ...
             sd, n, 2^n-1))
        end
        val_d = d;
    else
        error(sd + " doit etre un nombre ou une chaine de caractere");
    end
    
endfunction        
    

//////////////////////////////////////////////////////////////////////////////
// AJOUT 2021-2022
// determination de la valeur dont le codage "reel flottant 64 bits" est
// [s,e,m]
// Entree : s = chaine de 1 caractere ou entier entre 0 et 1
//          e = chaine de 11 caracteres ou entier entre 0 et 2^11-1
//          m = chaine de 52 caracteres ou entier entre 0 et 2^52-1
//           s,e,m composes uniquement de caracteres '0' ou '1' 
//           dans le cas de chaine de caracteres
// Sortie : v = valeur correspondante
function v = codage64_vers_reel(s,e,m)
    // test des parametres en entree
    val_s = conformite_valeur_reel64(s,"s",1)
    val_e = conformite_valeur_reel64(e,"e",11)
    val_m = conformite_valeur_reel64(m,"m",52)
    
    // test valeur non reelle
    if val_e==2047 then
        if val_m==0 then
            // valeur infinie
            if val_s==0 then
                v = %inf;
            else
                v = -%inf;
            end
        else
            v = %nan
        end
        return;
    end
    
    // cas valeur reelle
    if val_e==0 then
        M = val_m;
        // multiplier M par 2^(-1074)
        v = M/2^500;
        v = v/2^574;
    else
        M = val_m+2^52;
        E = val_e-1075;
        if E<-1000 then
            v = M*2^(-500);
            v = v*2^(E+500);
        else
            v = M*2^E; 
        end
    end
    
    // prise en compte du signe
    if val_s==1 then
        v = -v;
    end
    
endfunction

//////////////////////////////////////////////////////////////////////////////
// ecriture du codage reel 64 chiffres binaires
// sous la forme signe (1 chiffre), exposant (11 c.), mantisse (52 c.)
function ecrire_codage64(v)
    // test des parametres en entree
    if type(v)~=1 then
        error("v doit etre une valeur numerique")
    end
    if length(v)~=1 then
        error("v doit etre un scalaire et non pas un tableau")
    end
    
    // codage
    [s,e,m] = reel_vers_codage64(v);
    
    // ecriture
    mprintf("Codage 64 chiffres binaires :\n")
    mprintf(" signe s :\n  codage = %s\n  valeur = %d\n",entier_vers_codage(s,1),s)
    mprintf(" exposant e :\n  codage = %s\n  valeur = %d\n",entier_vers_codage(e,11),e)
    mprintf(" mantisse m :\n  codage = %s\n  valeur = %1.0f\n",entier_vers_codage(m,52),m)
endfunction


//////////////////////////////////////////////////////////////////////////////
// soit r un nombre entier dont l'ecriture en base 10 est la chaine cr
// cette fonction calcule R = 2*r,
//  et renvoie la chaine de caracteres cR, ecriture en base 10 de R
function cR = string_mul_2(cr)
    // chiffres de cr
    tr = ascii(cr)-48;
     
    // multiplication par 2
    tR = tr*2;
    if (tr(1)>=5) then
        tR = [0 tR];
    end
    for i=length(tR):-1:2
        if tR(i)>=10 then
            tR(i)=tR(i)-10;
            tR(i-1)=tR(i-1)+1;
        end
    end
    
    // chaine cR
    cR = ascii(tR+48);
endfunction

//////////////////////////////////////////////////////////////////////////////
// soit r un nombre entier dont l'ecriture en base 10 est la chaine cr
// cette fonction calcule R = 5*r,
//  et renvoie la chaine de caracteres cR, ecriture en base 10 de R
function cR = string_mul_5(cr)
    // chiffres de cr
    tr = ascii(cr)-48;
     
    // multiplication par 5
    tR = tr*5;
    if (tr(1)>=2) then
        tR = [0 tR];
    end
    for i=length(tR):-1:2
        if 10<=tR(i) & tR(i)<20 then
            tR(i)=tR(i)-10;
            tR(i-1)=tR(i-1)+1;
        elseif 20<=tR(i) & tR(i)<30 then
            tR(i)=tR(i)-20;
            tR(i-1)=tR(i-1)+2;
        elseif 30<=tR(i) & tR(i)<40 then
            tR(i)=tR(i)-30;
            tR(i-1)=tR(i-1)+3;
        elseif 40<=tR(i) then
            tR(i)=tR(i)-40;
            tR(i-1)=tR(i-1)+4;
        end
    end
    
    // chaine cR
    cR = ascii(tR+48);
endfunction

/////////////////////////////////////////////////////////////////////////////
// codage du reel flottant v au format binaire 64 chiffres binaires
// Entree : v = reel, ou %inf ou -%inf ou %nan
// Sortie : s = entier 0 ou 1
//          e = entier entre 0 et 2^11-1
//          m = entier entre 0 et 2^53-1
// si e = 0 : v = (-1)^s * 2^(-1074) * m
// si 1 <= e <= 2046 : v = (-1)^s * 2^(e-1075) * m
// si e = 2047 : v valeur non reelle
function [s,e,m] = codage_entier_reel64(v)
    // test des parametres en entree
    if type(v)~=1 then
        error("v doit etre une valeur numerique")
    end
    if length(v)~=1 then
        error("v doit etre un scalaire et non pas un tableau")
    end
    
    // cas Not A Number (%nan)
    if isnan(v) then
        s = 0;
        e = 2047;
        m = 2^51;
        return
    end
    
    // cas infini (%inf ou -%inf)
    if isinf(v) then
        if v<0 then
            s = 1;
        else
            s = 0;
        end
        e = 2047;
        m = 0;
        return
    end
    
    //-- v est une valeur reelle --//
    
    // le signe
    if v<0 then
        s = 1;
        v = -v; // remplacer v par sa valeur absolue
    else
        s = 0;
    end
    
    // cas v < 2^(-1022)
    if v<2^(-1022) then
        e = 0;
        
        // multiplier v par 2^(1074)
        m = v*2^(1000);
        m = m*2^(74);
        return;
    end
    
    // cas v >= 2^(-1022)
    // recherche de l'entier p tel que 1 <= v*2^(p) < 2
    // et remplacer v par v/2^(p)
    p=0;
    while v>=2
        p=p+1;
        v=v/2;
    end
    while v<1
        p=p-1;
        v=v*2;
    end
    e = p+1023
    m = v*2^(52)
        
endfunction 

///////////////////////////////////////////////////////////////////////////////
// soit cR l'ecriture d'un nombre entier R en base 10 (cR chaine de caracteres)
// et n un entier relatif, cette fonction renvoie cR10n l'ecriture decimale
// de R*10^n
// Exemples :
//  cR = "3480" , n= 3 --> cR10n = "3480000"
//  cR = "3480" , n=-1 --> cR10n = "348"
//  cR = "3480" , n=-3 --> cR10n = "3.48"
//  cR = "3480" , n=-4 --> cR10n = "0.348"
//  cR = "3480" , n=-6 --> cR10n = "0.00348"
//  cR = "0", n qcq    --> cR10n = "0"
//  cR = qcq, n =0     --> cR10n = cR
function cR10n = string_mul_10n(cR, n)
    
    // cas cR="0" ou n=0
    if cR=="0" | n==0 then
        cR10n = cR;
        return
    end
    
    // conversion de cR en chiffres
    tcR = ascii(cR)-48;
    
    if n>0 then
        // cas n>0
        // ajouter n 0 au tableau tcR
        for i=1:n
            tcR = [tcR 0];
        end
    elseif n<0
        // supprimer les éventuels zeros à la fin de cR10n en divisant par 10
        n = -n;
        i=0;
        nC = length(tcR);
        while i<n & nC>1 & tcR(nC)==0
            i=i+1;
            nC = nC-1;
            tcR = tcR(1:nC);
        end

//mprintf("nC = %d\n", nC)
//mprintf("nC = %d\n", n)
//mprintf("nC = %d\n", i)
//disp(tcR)
        
        if i<n then
            // la valeur finale non entière (avec décimale(s))
            // positionner la virgule apres le chiffre des unites
            posVirgule = nC+1;
            // deplacer la virgule vers la gauche de nC-i positions
            posVirgule = posVirgule-(n-i);
        
//mprintf("posVirgule = %d\n", posVirgule)
            if posVirgule<2 then
                // le nombre final est inferieur strict à 1
                // de la forme 0.xxx
                // ajouter au début de tcR : O -2 puis 1-posVirgule 0
                tcR = [0 -2 zeros(1,1-posVirgule) tcR]
            else
                // le nombre final est supérieur à 1
                // ajouter le point dans l'écriture du nombre
                tcR = [tcR(1:posVirgule-1) -2 tcR(posVirgule:nC)]
            end
        end
    end
    
    // convertir tcR en chaine de caracteres
    cR10n = ascii(tcR+48);
    
endfunction

// convertit l'entier natural m en une chaine de caractere correspondant
// a son ecriture en base 10
function s = string_entier_10(m)
    s = "";
    while m>0
        r = modulo(m,10);
        s = ascii(r+48)+s;
        m = (m-r)/10;
    end
endfunction

// chaine de caractere correspondant a l'ecriture au format scientifique
// de m * 10^p avec m entier naturel correspondant au nombre  
// dont l'ecriture en base 10 est sm, 
// et p entier relatif
function smp = format_sc_m_p(sm,p)
    lsm = length(sm);
    if lsm > 1 then
        // decomposition en chiffres decimaux de sm
        tm = ascii(sm)-48;
        
        // suppression des zeros en fin de chaine
        while tm(lsm)==0
            lsm = lsm-1
            p = p+1
        end
        
        if lsm>1 then
            // deplacement de la virgule apres le premier chiffre
            tm = [tm(1) -2 tm(2:lsm)];
            p = p+lsm-1
        else
            tm = tm(1);
        end
        sm = ascii(tm+48);
    end
    if p>=0 then
        smp = msprintf("%sE+%d", sm,p)
    else
        smp = msprintf("%sE-%d", sm,-p)
    end
    
endfunction

///////////////////////////////////////////////////////////////////////////////
// ecrire la valeur exacte de la valeur v au format decimal
function ecrire_format_f(v)
    // decomposition signe exposant mantisse de v
    [s,e,m] = codage_entier_reel64(v);
    
    // cas e = 2047
    if e==2047 then
        if m==0 then
            if s==0 then
                // cas +infini
                mprintf("+Inf\n");
            else
                // cas -infini
                mprintf("-Inf\n");
            end
        else
            // cas NaN
            mprintf("NaN\n");    
        end
    else
        // modif. de e dans le cas e=0
        // pour utiliser ensuite la formule unique
        // v = (-1)^s * 2^(e-1075) * m
        if e==0 then
            e=-1
        end
        
        // ecriture decimale de m
        cm = string_entier_10(m);
        
        if e<1075 then
            // multiplier m par 5^(1075-e)
            for i=1:1075-e
                cm = string_mul_5(cm)
            end
            
            // diviser m par 10^(1075-e)
            cm = string_mul_10n(cm, e-1075);
        elseif e>1075
            // multiplier m par 2^(e-1075)
            for i=1:e-1075
                cm = string_mul_2(cm)
            end
        end
        
        // ecriture avec le signe
        if s==0 then
            mprintf(" %s\n", cm)
        else
            mprintf("-%s\n", cm)
        end
    end
endfunction

///////////////////////////////////////////////////////////////////////////////
// ecrire la valeur exacte de la valeur v au format scientifique
function ecrire_format_e(v)
    // decomposition signe exposant mantisse de v
    [s,e,m] = codage_entier_reel64(v);
    
    // cas e = 2047
    if e==2047 then
        if m==0 then
            if s==0 then
                // cas +infini
                mprintf("+Inf\n");
            else
                // cas -infini
                mprintf("-Inf\n");
            end
        else
            // cas NaN
            mprintf("NaN\n");    
        end
    elseif e==0 & m==0 then
        // cas v nulle
        mprintf("0\n");
    else
        // modif. de e dans le cas e=0
        // pour utiliser ensuite la formule unique
        // v = (-1)^s * 2^(e-1075) * m
        if e==0 then
            e=-1
        end
        
        // écriture décimale de m
        cm = string_entier_10(m);
        
        if e<1075 then
            // multiplier m par 5^(1075-e)
            for i=1:1075-e
                cm = string_mul_5(cm)
            end
            
            // diviser m par 10^(1075-e)
            puissance10 = e-1075;
        elseif e>1075
            // multiplier m par 2^(e-1075)
            for i=1:e-1075
                cm = string_mul_2(cm)
            end
            puissance10 = 0;
        else
            puissance10 = 0;
        end
        
        // ecriture avec le signe
        if s==0 then
            mprintf(" ")
        else
            mprintf("-")
        end
        mprintf("%s\n", format_sc_m_p(cm,puissance10))
    end
endfunction

[s,e1,m1] = reel_vers_codage64(1.2);
[s,e2,m2] = reel_vers_codage64(1.7);
mprintf (" e1 = %4.0f, m1 = %16.0f\n" , e1 , m1)
mprintf (" e2 = %4.0f, m2 = %16.0f\n" , e2 , m2)

[s,e,m] = reel_vers_codage64(2.24 * 10^(-16));
mprintf(" s=%1.0f, e=%1.0f, m=%1.0f\n" , s, e, m)

vn = 2* sqrt (2);
for n =1:30
    mprintf("n = %2d , v(%2d) = %20.15f\n", n, n, vn );
    vn = 2*vn/sqrt(2+sqrt(4-( vn / 2^n )^2))
end
