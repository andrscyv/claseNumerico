close all; clear all; clc;
%funcion de flujo
f = @(t,y) (-5*y+ 6*y^2 - y^3);
y0 = 3;
t0 = 0;
T = 10;
n = 50;

%Euler implicito
%n=50 => h = 1/5
[w t] = eulerImp(y0, t0,T, n);
%dobleu = w(10)
%w(10) es 5.000
%Converge a la sol estacionario y=0
%plot(t,w)
hold on

%Euler explicito
n=200;
%n = 200 => h = 1/20
[w,t] = eulerExp(f,y0,n,t0,T);
%plot(t,w)

n=150;
%n = 200 => h = 1/20
[w,t] = eulerExp(f,y0,n,t0,T);
%plot(t,w)

n=100;
%n = 200 => h = 1/20
[w,t] = eulerExp(f,y0,n,t0,T);
%plot(t,w)



%RK23
n=180;
tol  = 0.001;
h0 =0.002;
[w,t] = rk23(f,y0,t0,n,tol,h0);
plot(t,w)