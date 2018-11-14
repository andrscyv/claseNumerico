close all; clear all; clc;
disp('Ejercicio 3')
disp('------------------------------------------------------')

disp('')

disp('Solucion exacta en t=1:')
solEx = [cos(2)*exp(-1); -sin(2)*exp(-1)]

disp('')
% h=1/10
disp('Punto Medio Implicito con h = 1/10: ')
M = [-1 2; -2 -1];
%Obtiene la aproximacion de la matriz M con el punto medio implicito en el intervalo [0,1]
%con condicion inicial y = [1 0] con h = 1/10
[w, t] = puntoMedioImp (10, 1, M, 0, [1,0]);
disp('Aproximacion en t=1:')
aprox = w(end,:)'
%obtiene los errores globales de las aproximaciones y la solucion exacta
errGlob = abs(aprox - solEx)

%plot (t,w(:,1))
%hold on
%plot (t,w(:,2))

disp('')
% h=1/100
disp('Punto Medio Implicito con h = 1/100: ')
%Obtiene la aproximacion de la matriz M con el punto medio implicito en el intervalo [0,1]
%con condicion inicial y = [1 0] con h = 1/100
 [w, t] = puntoMedioImp (100, 1, M, 0, [1,0]);
 disp('Aproximacion en t=1:')
aprox = w(end,:)'
%obtiene los errores globales de las aproximaciones y la solucion exacta
errGlob = abs(aprox - solEx)

plot (t,w(:,1))
hold on
plot (t,w(:,2))