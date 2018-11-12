function [w t] = trapecioExp (f, y0, t0, tf, n)
  w = zeros(n+1,1);
  t = zeros(n+1,1);
  h = (tf-t0)/n;
  w(1) = y0;
  t(1) = t0;
  
  for k = 1:n
    w(k+1) = w(k) + h/2*(f(t(k),w(k)) + f(t(k)+h, w(k) + h*f(t(k),w(k))));
    t(k+1) = t(k)+h;
  end
  
endfunction
