format long; clear all; close all; clc;
%Funcion de preferencia: y' = −2y + 4t con intervalo [0,1]
fPrima = @(t,y) -2*y + 4*t;
f = @(t) 4*exp(-2*t)+2*t-1;

solEx = 4*exp(-2) + 1;

n = [50 100 200];

h = [1/50 1/100 1/200];

g = zeros(3,4);

for k=1:3
  [w t] = eulerExp(fPrima, 3, n(k), 0, 1);
  w(end)
  g(k,1)= abs(w(end)-solEx);
  
  [w t] = trapecioExp(fPrima, 3, 0, 1, n(k));
  w(end)
  g(k,2)= abs(w(end)-solEx);
  
  [w t] = puntoMedioExp(fPrima, 3, 0, 1, n(k));
  w(end)
  g(k,3)= abs(w(end)-solEx);
  
  [w t] = RK4(0, 1, 3, fPrima, n(k));
  w(end)
  g(k,4)= abs(w(end)-solEx);  
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