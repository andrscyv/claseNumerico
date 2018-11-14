function [s] = NewtonShooting (f,s0, tol,h)
    
    s(1) = s0;
    %deltaF = (f(s0+h)-f(s0))/h;
    cont = 1;
  while abs(f(s(cont))) > tol
    s(cont+1) = s(cont) - (1/((f(s(cont)+h)-f(s(cont)))/h))*f(s(cont));
    cont =cont+1;
  end
  cont=cont-1
end
