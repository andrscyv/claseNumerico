function [w,t,h] = RK4(t0,T, y0, f, N)
%Calcula las aproximaciones de f en el intervalo [t0,T] con N+1 puntos y condicion
%inicial y0. Regresa las aproximaciones (w), los puntos evaluados (t) y h
w = zeros(N+1,1);
t = zeros(N+1,1);
w(1) = y0;
t(1) = t0;
h = (T-t0)/N;
h2 = h/2;
for n = 1:N
    
    s1 = f(t(n),w(n));
    s2 = f(t(n)+h2,w(n)+h2*s1);
    s3 = f(t(n)+h2,w(n)+h2*s2); 
    t(n+1) = t(n)+h;
    s4 = f(t(n+1),w(n)+h*s3);
    
    w(n+1) = w(n)+h/6*(s1 + 2*s2 + 2*s3 + s4);
end

    
   
end

