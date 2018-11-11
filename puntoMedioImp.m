function [w, t] = puntoMedioImp (n, T, M, t0, y0) %para una matriz de 2x2
  h = (T-t0)/n;
  w = zeros(n+1,2);
  t = zeros(n+1,1);
  
  A = eye(2) - h/2 *M;
  B = inv(A);
  w(1,:) = y0;
  t(1)=t0;
  for i=1:n
    w(i+1,:) = B*(w(i,:)' + h/2 * M * w(i,:)');
    t(i+1) = t(i)+h;
  end
  
endfunction
