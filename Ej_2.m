format long; clear all; close all; clc;

%Creamos el handle para nuestra funci�n
f = @(t,y) -2*y + 4*t;


%evaluamos el m�todo de Euler expl�cito usando h=0.1 en el intervalo [0,1]
%y condici�n inicial y(0)=3
[w t] = eulerExp(f, 3, 10, 0, 1);

%calculamos la solucion exacta 
solEx = 4*exp(-2) + 1;

%calculamos error global en t=1
Trapecio_h1 = abs(w(end) - solEx)

%h2 = h1 / 2
[w t] = eulerExp(f, 3, 20, 0, 1);

%calculamos error global en t=1
Trapecio_h2 = abs(w(end) - solEx)

[w t h] = RK4(0,1,3,f,10);

RK4_h1 = abs(w(end) - solEx)

%T = table(Trapecio_h1,Trapecio_h2,RK4_h1);
%T


