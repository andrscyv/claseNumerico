function max = maxErrLocal( w, t, sol )
%Calcula el maximo del error local en cada aproximacion
max = 0;
tam = length(w);
for i = 2:tam
    %saca el error local en cada iteracion
    errloc = abs(sol(t(i),w(i-1),t(i-1))-w(i));
        
    if errloc > max
        max = errloc;
    end

end

