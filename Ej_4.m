close all; clear all; clc; format long;
disp('Ejercicio 4')
disp('------------------------------------------------------')
disp('Funcion a aproximar: ')
%funcion de flujo

f = @(t,y) (-5*y+ 6*y^2 - y^3)
y0 = 3;
t0 = 0;
T = 10;
n = 50;

disp('con condiciones iniciales en y(0) = 3, en el intervalo [0,10]')

%Euler implicito
%n=50 => h = 1/5
disp('Euler Implicito en el intervalo con h = 1/5')
[w t] = eulerImp(y0, t0,T, n);

disp('Valor aproximado de y(10): ')
w(10)
%dobleu = w(10)
%w(10) es 5.000
%Converge a la sol estacionario y=0
plot(t,w)
hold on

%Euler explicito
n=200;
%n = 200 => h = 1/20
disp('Euler Explicito en el intervalo con h = 1/20')
[w,t] = eulerExp(f,y0,n,t0,T);
%plot(t,w)

n=150;
%n = 150 => h = 1/15
disp('Euler Explicito en el intervalo con h = 1/15')
[w,t] = eulerExp(f,y0,n,t0,T);
%plot(t,w)

n=100;
%n = 100 => h = 1/10
disp('Euler Explicito en el intervalo con h = 1/10')
[w,t] = eulerExp(f,y0,n,t0,T);
%plot(t,w)

n=50;
%n = 50 => h = 1/5
disp('Euler Explicito en el intervalo con h = 1/5')
[w,t] = eulerExp(f,y0,n,t0,T);
%plot(t,w)



%RK23
n=30;
tol  = 0.1;
h0 =1;
[w,t] = rk23(f,y0,t0,n,tol,h0);
%plot(t,w)