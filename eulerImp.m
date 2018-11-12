function [w t] = eulerImp (y0, t0, T, n) %para ejercicio 4
  w = zeros(n+1,1);
  t = zeros(n+1,1);
  w(1) = y0;
  t(1) = t0;
  h = (T-t0)/n;
  f = @(y) (-5*y+ 6*y^2 - y^3);
  fPrima = @(y)(-5 +12*y -3*y^2);
  ecParam = @(w,h,w0) h*w^3-6*h*w^2+(5*h+1)*w-w0;
  c = [h -6*h 5*h+1 w(1)];
  for i=1:n
    c(4) = w(i);
    sols = roots(c);
    reals = sols == real(sols);
    %w(i+1) = Newton(f, fPrima, w(i), 0.0000001);
    w(i+1) = max(sols(reals));
    t(i+1) = t(i)+h;
  end
endfunction
