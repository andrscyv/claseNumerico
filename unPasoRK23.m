function [t,w,h] = unPasoRK23(t0,w0,h0,tol,f)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

h = h0;

s1 = f(t0,w0);
s2 = f(t0+h,w0+h*s1);
s3 = f(t0+h/2,w0+(h/2)*(s1+s2)/2);
wSig = w0+h/2*(s1+s2);
wTSig = w0+(h/6)*(s1+4*s3+s2);
err = abs(wSig-wTSig);
theta = 0.001;
denom = (max([abs(w0) theta]));
h = (((tol*denom)/err)^(1/3))*h0;
if err / denom > tol
    
    s1 = f(t0,w0);
    s2 = f(t0+h,w0+h*s1);
    s3 = f(t0+h/2,w0+(h/2)*(s1+s2)/2);
    wSig = w0+h/2*(s1+s2);
    wTSig = w0+(h/6)*(s1+4*s3+s2);
    err = abs(wSig-wTSig);
    denom = (max([abs(w0) theta]));
    
    if err / denom >tol
        do 
            h = h/2;
            s1 = f(t0,w0);
            s2 = f(t0+h,w0+h*s1);
            s3 = f(t0+h/2,w0+(h/2)*(s1+s2)/2);
            wSig = w0+h/2*(s1+s2);
            wTSig = w0+(h/6)*(s1+4*s3+s2);
            err = abs(wSig-wTSig);
            denom = (max([abs(w0) theta]));
        until err / denom < tol
    end
end
t = t0+h;
w = wSig;



%plot(t,w)

end

