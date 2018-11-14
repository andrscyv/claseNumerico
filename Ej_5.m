format long; clear all; close all; clc;
%Funcion de preferencia: y' = −2y + 4t con intervalo [0,1]
disp('Ejercicio 5')
disp('------------------------------------------------------')
disp('Funcion a evaluar en el intervalo [0,1]: ')
fPrima = @(t,y) -2*y + 4*t
disp('Funcion solucion: ' )
f = @(t) 4*exp(-2*t)+2*t-1

disp('')
disp('Solucion exacta en t=1: ')
solEx = 4*exp(-2) + 1

disp('')
n = [50 100 200];

h = [1/50 1/100 1/200];

g = zeros(3,4);

%Un for para que corran los 4 métodos con las 3 h distintas
%los errores globales se guardan en g como: en los renglones son los errores con la misma
%h y las columnas son cada uno de los metodos
for k=1:3
  fprintf("Metodos con h = %d",h(k))
  disp('')
  disp('Euler Explicito:')
  [w t] = eulerExp(fPrima, 3, n(k), 0, 1);
  disp('Aproximacion en t=1:')
  aprox = w(end)
  disp('Error global:')
  g(k,1)= abs(aprox-solEx);
  errorGlobal = g(k,1)
  
  disp('')
  disp('Trapecio Explicito:')
  [w t] = trapecioExp(fPrima, 3, 0, 1, n(k));
  disp('Aproximacion en t=1:')
  aprox = w(end)
  disp('Error global:')
  g(k,2)= abs(aprox-solEx);
  errorGlobal = g(k,2)
  
  disp('')
  disp('Punto Medio Explicito:')
  [w t] = puntoMedioExp(fPrima, 3, 0, 1, n(k));
  disp('Aproximacion en t=1:')
  aprox = w(end)
  disp('Error global:')
  g(k,3)= abs(aprox-solEx);
  errorGlobal = g(k,3)
  
  disp('')
  disp('RK4:')
  [w t] = RK4(0, 1, 3, fPrima, n(k));
  disp('Aproximacion en t=1:')
  aprox = w(end)
  disp('Error global:')
  g(k,4)= abs(aprox-solEx);
  errorGlobal = g(k,4)
  disp('')
end

plot(log(h), log(g(:,1)))  %Euler
hold on
plot(log(h), log(g(:,2)),'*') %Trapecio
plot(log(h), log(g(:,3)),'--') %Punto Medio
plot(log(h), log(g(:,4))) %RK4
title('Error global vs h en t=1')
xlabel('log(h)')
ylabel('log(errorGlobal)')

%tablas