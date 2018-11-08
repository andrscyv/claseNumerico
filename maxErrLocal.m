function max = maxErrLocal( w, t, sol )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
max = 0;
tam = length(w);
for i = 2:tam
    errloc = abs(sol(t(i),w(i-1),t(i-1))-w(i));
    
    if errloc > max
        max = errloc;
    end

end

