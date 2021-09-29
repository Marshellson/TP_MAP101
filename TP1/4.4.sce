// Copyright (C) 2021 - UGA - JIANG Yilun
//
// Date of creation: 2021-9-16
//

a = 46; b = 66;
mprintf("a = %d , b = %d \n", a, b)

while a>0
    r = a
    a = pmodulo(b, a)
    b = r
end
mprintf("le pcgd de a et b est %d\n", b)
