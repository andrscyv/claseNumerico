function [res] = Shooting(s)
%Calcula la diferencia de la funcion aproximada a f del ejercicio 6 con la pendiente incial s
%pvi
f = @(y1,y2)[y2 4*y2*(2-y1)]';
y0 = [2 s]';
n = 200;
t0 = 0;
tf = 1/2;
[w,t] = eulerExpVect(f,y0,n,t0,tf);
% plot(t,w(1,:))
% hold on
% plot(t,w(2,:))
res = w(1,n+1)-2+pi/4;
end

