function [w t] = eulerImp (y0, t0, T, n) %para ejercicio 4
  w = zeros(n+1,1);
  t = zeros(n+1,1);
  w(1) = y0;
  t(1) = t0;
  h = (T-t0)/n;
  f = @(x) 1/5*(-5*x + 6*x^2 - x^3);
  fPrima = @(x) 1/5*(-5 +12*x -3*x^2);
  for i=1:n
    w(i+1) = Newton(f, fPrima, w(i), 0.0000001);
    t(i+1) = t(i)+h;
  end
endfunction
