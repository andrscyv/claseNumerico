function [a] = NewtonShooting (f,s0, tol,h)
    
    s = zeros(100,1);
    s(1) = s0;
    deltaF = f(
  while f(a) > tol
    a = a - f(a)/fPrima(a);
  end
end
