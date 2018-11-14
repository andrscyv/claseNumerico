close all; clear all; clc;format long;
%S0 inicial
s0 = 3;

%Definimos la funcion del shooting method
%a la cual le queremos encontrar una raiz
f = @(s) Shooting(s);

%Encontramos la s optima 
tol = 10e-10;
h0 = 0.001;
[s, numIter] = NewtonShooting (f,s0, tol,h0)

%Los valores de F(s) para cada s_i calculada
valF_s = arrayfun(f,s)

%Calculamos la aproximacion con euler explicito
% para la s que encuentra Newton
n=200;
[w,t] = solPVF(s(numIter+1),n);

%Calculamos el error maximo entre la sol exacta y la aprox
sol = @(t)2-pi/4*tan(pi*t/2);
exact = sol(t);
maxErrorConSolExact = max(abs(w-exact'))
