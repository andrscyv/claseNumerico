close all; clear all; clc;
%funcion de flujo
f = @(y) (-5*y+ 6*y^2 - y^3);
y0 = 3;
t0 = 0;
T = 10;
n = 50;

%n=50 => h = 1/5
[w t] = eulerImp(y0, t0,T, n);
%w(10) es -1.051 
%no converge a ninguna de las sols estacionarias
plot(t,w)
hold on

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

n=5000;
%n = 200 => h = 1/20
[w,t] = eulerExp(f,y0,n,t0,T);
plot(t,w)

tspan = [0 10];
[t,y] = ode45(f, tspan, y0);
%plot(t,y)

%RK23
n=40;
[w,t] = rk23(f,y0,t0,n,0.001,0.2);
plot(t,w)