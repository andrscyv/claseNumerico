function [a] = Newton (f, fPrima,x0, tol)
    a = x0;
  while f(a) > tol
    a = a - f(a)/fPrima(a);
  end
end
