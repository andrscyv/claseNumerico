function [w,t] = eulerExp(f,y0,n,t0,tf)
%Aplica el metodo de Euler Explicito en la funcion f en el intervalo [t0,tf] con
%n numero de puntos y valor inicial y0. Regresa las aproximaciones w en los 
%puntos del intervalo y dichos puntos en el arreglo t.
h = (tf-t0)/n;
t  = zeros(n+1,1);
w = zeros(n+1,1);
w(1) = y0;
t(1) = t0;
for k=1:n
    t(k+1) = (k)*h+t0;
    w(k+1) = w(k)+h*f(t(k),w(k));
end

%plot(t,w)

end

