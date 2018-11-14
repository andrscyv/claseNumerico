function [w,t] = solPVF(s,n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
f = @(y1,y2)[y2 4*y2*(2-y1)]';
y0 = [2 s]';
n = 40;
t0 = 0;
tf = 1/2;
[w,t] = eulerExpVect(f,y0,n,t0,tf);
w = w(1,:);
end

