format long; clear all; close all; clc;

%Creamos el handle para nuestra funcion
disp('Ejercicio 1')
disp('------------------------------------------------------')
disp('Euler Explicito para la funcion: ')
f = @(t,y) -2*y + 4*t
disp('con intervalo [0,1], h = 0.1 y y(0)=3')
%evaluamos el metodo de Euler explicito usando h=0.1 en el intervalo [0,1]
%y condicion inicial y(0)=3
[w t] = eulerExp(f, 3, 10, 0, 1);
disp('Aproximaciones para los 11 puntos: ')
w


%Guardamos la solucion exacta de la EDO evaluada en t=1
disp('Solucion exacta en t=1: ')
solEx = 4*exp(-2) + 1

%Evaluamos el error global de nuestro metodo en t=1
disp('Error global en t=1: ')
errGlobal = abs(w(11)-solEx)

%Declaramos el vector que almacenara la cantidad de intervalos que usaremos
n = zeros(6,1);

%Declaramos el vector que almacenara el tamaño de las h que usaremos
h = zeros(6,1);

%Declaramos el vector que almacenara las aproximaciones del metodo con las
%h diferentes en el tiempo t=1
y = zeros(6,1);

%Declaramos al vector que corresponde a los errores globales del metodo en
%el tiempo t=1
g = zeros(6,1);

%Le damos valores al vector de intervalos n
for k=1:6
    n(k)= 10*2^(k-1);
end

%Le damos valores al vector de tamaños de h
for k=1:6
    h(k) = 1/n(k);
end

%Evaluamos nuestro metodo con las diferentes h y almacenamos la
%aproximacion en el tiempo t = 1.
%Calcular max error local de cada aproximacion
%La sol exacta , con condicion inicial como parametro
sol = @(t,y0,t0) (y0-2*t0+1)*exp(-2*t+2*t0)+2*t-1;
errLocalesMax = zeros(6,1);
for k=1:6
    [w t] = eulerExp(f, 3, n(k), 0, 1);
    errLocalesMax(k) = maxErrLocal( w, t, sol );
    %Almacenamos la ultima aproximacion del metodo que corresponde al
    %tiempo deseado
    y(k) = w(end);  
end

%Damos valores al vector de errores globales
for k=1:6
    g(k) = abs(y(k)-solEx);
end


colK = [0 1 2 3 4 5 ]';
%T = table(colK,h,errLocalesMax);
%T
%pkg load dataframe
%tab={"k","paso","maximo de errores locales del metodo de Euler","eoc"; colK(1,1), h(1,1), errLocalesMax(1,1),0};
%tt = dataframe(tab)
figure
plot(log(g),log(h))
title('Error global vs h en t=1')
xlabel('log(h)')
ylabel('log(errorGlobal)')
%plot(t,w)
