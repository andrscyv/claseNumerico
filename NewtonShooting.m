function [s,cont] = NewtonShooting (f,s0, tol,h)
%Calcula el cero de la funcion f con aproximacion incial s0 y tolerancias tol, h   
%Es decir, encontramos la s optima para que la diferencia de la aproximacion y la
%funcion evaluada sea 0. Regresa la s optima y el numero de iteraciones realizadas
    s(1) = s0;
    %deltaF = (f(s0+h)-f(s0))/h;
    cont = 1;
  while abs(f(s(cont))) > tol
    s(cont+1) = s(cont) - (1/((f(s(cont)+h)-f(s(cont)))/h))*f(s(cont));
    cont =cont+1;
  end
  cont=cont-1;
end
