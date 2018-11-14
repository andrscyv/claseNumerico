function [w,t] = solPVF(s,n)
%Regresa la aproximacion de f del ejercicio 6 de acuerdo a la pendiente calculada s

f = @(y1,y2)[y2 4*y2*(2-y1)]';
y0 = [2 s]';
t0 = 0;
tf = 1/2;
[w,t] = eulerExpVect(f,y0,n,t0,tf);
w = w(1,:);
end

