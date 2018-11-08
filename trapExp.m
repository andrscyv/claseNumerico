function [w,t] = trapExp(f,y0,n,t0,tf)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
h = (tf-t0)/n;
t  = zeros(n+1,1);
w = zeros(n+1,1);
w(1) = y0;
t(1) = t0;
for k=1:n
    t(k+1) = (k)*h+t0;
    pendiente = f(t(k),w(k));
    w(k+1) = w(k)+h*(pendiente+f(t(k+1),w(k)+h*pendiente));
end

%plot(t,w)

end

