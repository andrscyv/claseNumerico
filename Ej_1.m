format long; clear all; close all; clc;

%Creamos el handle para nuestra funci�n
f = @(t,y) -2*y + 4*t;

%evaluamos el m�todo de Euler expl�cito usando h=0.1 en el intervalo [0,1]
%y condici�n inicial y(0)=3
[w t] = eulerExp(f, 3, 10, 0, 1)

%Guardamos la soluci�n exacta de la EDO evaluada en t=1
solEx = 4*exp(-2) + 1;

%Evaluamos el error global de nuestro m�todo en t=1
errGlobal = abs(w(11)-solEx)

%Declaramos el vector que almacenar� la cantidad de intervalos que usaremos
n = zeros(6,1);

%Declaramos el vector que almacenar� el tama�o de las h que usaremos
h = zeros(6,1);

%Declaramos el vector que almacenar� las aproximaciones del m�todo con las
%h diferentes en el tiempo t=1
y = zeros(6,1);

%Declaramos al vector que corresponde a los errores globales del m�todo en
%el tiempo t=1
g = zeros(6,1);

%Le damos valores al vector de intervalos n
for k=1:6
    n(k)= 10*2^(k-1);
end

%Le damos valores al vector de tama�os de h
for k=1:6
    h(k) = 1/n(k);
end

%Evaluamos nuestro m�todo con las diferentes h y almacenamos la
%aproximaci�n en el tiempo t = 1.
for k=1:6
    [w t] = eulerExp(f, 3, n(k), 0, 1);
    
    %Almacenamos la �ltima aproximaci�n del m�todo que corresponde al
    %tiempo deseado
    y(k) = w(end);
end

%Damos valores al vector de errores globales
for k=1:6
    g(k) = abs(y(k)-solEx);
end

plot(g,h)

