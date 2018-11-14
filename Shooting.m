function [res] = Shooting(s)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%pvi
f = @(y1,y2)[y2 4*y2*(2-y1)]';
y0 = [2 s]';
n = 1000;
t0 = 0;
tf = 1/2;
[w,t] = eulerExpVect(f,y0,n,t0,tf);
% plot(t,w(1,:))
% hold on
% plot(t,w(2,:))
res = w(1,n+1)-2+pi/4;
end

