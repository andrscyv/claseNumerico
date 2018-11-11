close all; clear all; clc;

solEx = [cos(2)*exp(-1); -sin(2)*exp(-1)];

% h=1/10
M = [-1 2; -2 -1];
[w, t] = puntoMedioImp (10, 1, M, 0, [1,0]);
errGlob = abs(w(end,:)' - solEx)

%plot (t,w(:,1))
%hold on
%plot (t,w(:,2))

% h=1/100
 [w, t] = puntoMedioImp (100, 1, M, 0, [1,0]);
errGlob = abs(w(end,:)' - solEx)

plot (t,w(:,1))
hold on
plot (t,w(:,2))