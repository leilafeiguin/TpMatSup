% Primeras instalaciones
pkg load control
pkg load signal

eleccionIngreso = menu ("Seleccione una opcion para ingresar la funcion transferencia", "1. Por coeficientes", "2. Por polos, ceros y ganancia")

if(eleccionIngreso == 1)
  coeficientesNumerador = input("Ingrese los coeficientes del numerador con el siguiente formato: [coef1, coef2, ..., coefX]: ");
  coeficientesDenominador = input("Ingrese los coeficientes del denominador con el siguiente formato: [coef1, coef2, ..., coefX]: ");

elseif(eleccionIngreso==2)
  polos= input("Ingrese los polos con el siguiente formato: [polo1, polo2, ..., poloX]: ");
  ceros = input("Ingrese los ceros con el siguiente formato: [cero1, cero2, ..., ceroX]: ");
  ganancia = input ("Ingrese la ganancia: ");
endif


%Funciones
function [funcionTransferencia] = obtenerExpresionFuncionTransferencia(coeficientesNumerador, coeficientesDenominador)
  funcionTransferencia = tf(coeficientesNumerador, coeficientesDenominador)
  endfunction

function [polos] = indicarPolos(coeficientesDenominador) 
  polos = roots(coeficientesDenominador)
  endfunction
  
function [ceros] = indicarCeros(coeficientesNumerador) 
  ceros = roots(coeficientesNumerador)
  endfunction
  
function [ganancia] = marcarGananciaDeFuncion(coeficientesNumerador, coeficientesDenominador) 
  [ceros,polos,ganancia]=tf2zp(coeficientesNumerador, coeficientesDenominador)
  endfunction

function [expresion, ceros, polos, ganancia] = obtenerExpresionConPolosCerosYGanancia(coeficientesNumerador, coeficientesDenominador)
  expresion = obtenerExpresionFuncionTransferencia(coeficientesNumerador, coeficientesDenominador)
  [ceros, polos, ganancia]=tf2zp(coeficientesNumerador, coeficientesDenominador)
endfunction  

function [] = mostrarGraficamentePolosYCeros(funcionTransferencia)
  pzmap(funcionTransferencia)
  endfunction
  
function [estabilidad] = indicarEstabilidadDelSistema(polos, ceros)
  polosPositivos = 0;
  polosNulos = 0;
  polosReales = setdiff(polos, ceros);
  cerosReales = setdiff(ceros, polos);

   for i = 1:length(polosReales)
        if (real(polosReales(i)) > 0)
          polosPositivos++;
        endif
        if (real(polosReales(i)) == 0)
          polosNulos++;
        endif
      endfor
      
      if (polosPositivos != 0)
        estabilidad = "Inestable";
      elseif (polosNulos == 0)
        estabilidad = "Estable";
      elseif (polosNulos == 1)
        estabilidad = "Marginalmente estable";
      elseif (polosNulos > 1)
        estabilidad = "Inesatble";
      endif
  endfunction

%Falta:
%7. Que muestre en la interfaz indicar estabilidad del sistema.
%8. Obtener todas las caracter�sticas de la funci�n transferencia: Esta funcionalidad barre todos los puntos anteriores (1, 2, 3, 4, 5,6 y 7).
%9. Ingresar una nueva funci�n.
%10. Finalizar.




eleccionIngresoSegundoMenu = menu ("Seleccione que desea obtener", "1. Obtener la expresión de la función transferencia", "2. Indicar Polos", "3. Indicar Ceros", "4. Marcar ganancia de la función", "5. Obtener expresión con sus polos, ceros y ganancia", "6. Mostrar gráficamente la distribución de polos y ceros", "7. Indicar estabilidad del sistema", "8. Obtener todas las características de la función transferencia", "9. Ingresar una nueva función", "10. . Finalizar");

switch(eleccionIngresoSegundoMenu)
  case 1
    obtenerExpresionFuncionTransferencia(coeficientesNumerador, coeficientesDenominador);
  case 2
    indicarPolos(coeficientesDenominador);
   case 3
    indicarCeros(coeficientesNumerador);
   case 4
    marcarGananciaDeFuncion(coeficientesNumerador, coeficientesDenominador);
   case 5
    obtenerExpresionConPolosCerosYGanancia(coeficientesNumerador, coeficientesDenominador);
   case 6
    mostrarGraficamentePolosYCeros(obtenerExpresionFuncionTransferencia(coeficientesNumerador, coeficientesDenominador));
   case 7
     indicarEstabilidadDelSistema(polos, ceros);
   case 8
    obtenerExpresionFuncionTransferencia(coeficientesNumerador, coeficientesDenominador);
    indicarPolos(coeficientesDenominador);
    indicarCeros(coeficientesNumerador);
    marcarGananciaDeFuncion(coeficientesNumerador, coeficientesDenominador);
    obtenerExpresionConPolosCerosYGanancia(coeficientesNumerador, coeficientesDenominador);
    mostrarGraficamentePolosYCeros(obtenerExpresionFuncionTransferencia(coeficientesNumerador, coeficientesDenominador));
   case 9
   case 10
endswitch 




  
  
  