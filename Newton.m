function [a] = Newton (f, fPrima,a, tol)
  while (f(a)+a) > tol
    a = a - (f(a)+a)/fPrima(a);
  end
endfunction
