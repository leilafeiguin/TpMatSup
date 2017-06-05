% Primeras instalaciones
pkg load control
pkg load signal

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


%Falta:
%6. Mostrar gr�ficamente la distribuci�n de polos y ceros.
%7. Indicar estabilidad del sistema.
%8. Obtener todas las caracter�sticas de la funci�n transferencia: Esta funcionalidad barre todos los puntos anteriores (1, 2, 3, 4, 5,6 y 7).
%9. Ingresar una nueva funci�n.
%10. Finalizar.

  
  
  