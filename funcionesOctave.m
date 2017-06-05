% Primeras instalaciones
pkg load control
pkg load signal


%tf arma la funcion transferencia
funcionTransferencia = tf([1 2], [1 2 3])

%num{1} saca el vector de coeficientes del numerador de la funcion transferencia
numerador = funcionTransferencia.num{1}

%den{1} saca el vector de coeficientes del denominador de la funcion transferencia
denominador = funcionTransferencia.den{1}


%roots saca las raices de un vector de coeficientes
zeros = roots(numerador)
polos = roots(denominador)

%zero saca los ceros de una funcion
Zer= zero (gs)

%pole saca los polos de una funcion
Pol=pole(gs)

%tf2zp te devuelve los ceros, polos y ganancia. Hay que pasarle los vectores de coeficientes.
[Zer,Pol,k]=tf2zp([5 2],[1 4 20])