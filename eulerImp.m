function [w t] = eulerImp (y0, t0, T, n) %para ejercicio 4
  w = zeros(n+1,1);
  t = zeros(n+1,1);
  w(1) = y0;
  t(1) = t0;
  h = (T-t0)/n;
  c = [h -6*h 5*h+1 -1*w(1)];
  for i=1:n
    c(4) = -1*w(i);
     sols = roots(c);
     reals = sols == real(sols);
     reals = sols(reals);
     normas = reals-w(i);
    [val, idx] = min(abs(normas));
    w(i+1) = reals(idx);
    t(i+1) = t(i)+h;
  end
end
