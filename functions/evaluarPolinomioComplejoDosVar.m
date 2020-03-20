function [ecuacion] = evaluarPolinomioComplejoDosVar(x, y)
% Este metodo sirve para un polinomio en un punto recibido como parametro

% ecuacion = 5*x^4 - 2*x^3 + 4*x^2 -3*x + 28;

%% ecuacion diferencial de tercer grado
%% x''' + 2x'' - x' + 3x = 2t
%% y1' = y2
%% y2' = y3
%% y3' = 2*t-2*y3+y2-3*y1
%% dy = [y(2);    y(3);    2*x-2*y(3)+y(2)-3*y(1)];
% ecuacion = [y(2);    y(3);    2*x-2*y(3)+y(2)-3*y(1)];

%% ecuacion de segundo grado
%% y'' + 3y' -10y = 442 cos(3x)
%% a= 0, 5    y inciales 0, 1     con N=20 
%% y1' = y2
%% y2' = -3*y(2) + 10*y(1) + 442*cos(3*x)
ecuacion = [y(2);   -3*y(2) + 10*y(1) + 442*cos(3*x)];
 
end

