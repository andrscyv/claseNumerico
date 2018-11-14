format long; clear all; close all; clc;

%Creamos el handle para nuestra funcion
disp('Ejercicio 2')
disp('------------------------------------------------------')
disp('Trapecio Explicito para la funcion: ')
f = @(t,y) -2*y + 4*t
disp('con intervalo [0,1], h = 0.1 y y(0)=3')
disp('')

%evaluamos el metodo de Euler explicito usando h=0.1 en el intervalo [0,1]
%y condicion inicial y(0)=3
[w t] = trapecioExp(f, 3, 0, 1,10);

%calculamos la solucion exacta 
disp('Solucion exacta en t=1: ')

solEx = 4*exp(-2) + 1
disp('')

%calculamos error global en t=1
disp('Aproximacion en t=1: ')
aprox = w(end)
disp('Error global en t=1: ')
Trapecio_h1 = abs(aprox - solEx)

%h2 = h1 / 2
disp('')
disp('Trapecio Explicito para la misma funcion e intervalo con h = 0.05: ')
[w t] = trapecioExp(f, 3, 0, 1, 20);
disp('')
%calculamos error global en t=1
disp('Aproximacion en t=1: ')
aprox = w(end)
disp('Error global en t=1: ')
Trapecio_h2 = abs(aprox - solEx)

disp('')
disp('RK4 para la misma funcion e intervalo con h = 0.1: ')
disp('')
[w t h] = RK4(0,1,3,f,10);
disp('Aproximacion en t=1: ')
aprox = w(end)
disp('Error global en t=1: ')
RK4_h1 = abs(aprox - solEx)

%T = table(Trapecio_h1,Trapecio_h2,RK4_h1);
%T


