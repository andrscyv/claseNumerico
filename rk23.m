function [w,t] = rk23(f,y0,t0,n,tol,h0)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
h = h0;
t  = zeros(n+1,1);
w = zeros(n+1,1);
w(1) = y0;
t(1) = t0;
hs=zeros(n+1,1);
hs(1)=h0;
for k=1:n
    [t(k+1),w(k+1),h] = unPasoRK23(t(k),w(k),h,tol,f);
    hs(k+1) = h;
end

%plot(t,w)
minPaso = min(hs)

end

