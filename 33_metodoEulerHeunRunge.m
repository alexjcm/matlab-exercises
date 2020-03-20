clc, clear, clearvars;
%% Metodo Euler, Heun, Runge-Kutta4 para resolver ecuaciones diferenciales.
%%

%func = @(x,y) [y(2);    y(3);    2*x-2*y(3)+y(2)-3*y(1)];
func = @(x, y) [y(2);   -3*y(2) + 10*y(1) + 442*cos(3*x)];

% func = @(x,y) [y(2);   -3*y(2) + 10*y(1) + 442*cos(3*x)]; % funcion anonima
a = 0; % inicio de intervalo
b = 5; % b = fin de intervalo
y0 = [0, 1]; % condicion inicial de y (admite 1, 2 � 3 y iniciales 
% dependiendo si la funci�n tiene 1era. 2da o 3ra derivada)
N = 20; % Numero de subintervalos (iteraciones)

[xe, ye] =  eulerFunc(   func, a, b, y0, N);
[xh, yh] = heunFunc(     func, a, b, y0, N);
[xr, yr] = runge4Func(   func, a, b, y0, N);
% [xe, ye] = eulerFunc('evaluarPolinomioComplejoDosVar',    0, 5, [0, 1], 20);
% [xh, yh] = heunFunc(   'evaluarPolinomioComplejoDosVar',     0, 5, [0, 1], 20);
% [xr, yr] = runge4Func( 'evaluarPolinomioComplejoDosVar',    0, 5, [0, 1], 20);

% Solucion Exacta
% for i = 1:length(xh)
%     solEx(i) = exp(1/4) - power(1/2 - xh(i), 2);
% end
% solEx = solEx(:);

table(xh, ye, yh, yr) % x, heun, euler, runge4

%%
% PARA GRAFICAR
% plot(xh, ye);
% grid
% hold on
% plot(xh, yh);
% hold on
% plot(xh, yr);
% hold off
% legend('ye', 'yh', 'yr');
% title('M�todos Euler, Heun, Runge4');

%%
function [x, y] = eulerFunc(f, a, b, y0, N)
h = (b - a) / (N);
x = a:h:b; % Verifica si x es columna, de no ser lo convierte
x = x(:); % Inicializamos el vector llenandolo de ceros
y = zeros(N+1, length(y0));
y(1,:) = y0;
for k = 1 : N
    % Formula
    % Ysub(k+1) = Ysub(k) + h * f(Xsub(k), Ysub(k))
    y(k+1,:) = y(k,:) + h * feval(f, x(k), y(k,:))';
end
end

function [x, y] = heunFunc(f, a, b, y0, N)
%Metodo de heun para ec. de grado N
% 
h= (b - a) / N;
x = a:h:b; % Verifica si x es columna, de no ser lo convierte
x = x(:); % Inicializamos el vector llenandolo de ceros
y = zeros(N+1, length(y0));
y(1,:) = y0;
for k = 1:N
    % Se transponen los vectores k1 y k2
    % FORMULA
    % k1 = hf(xk, yk)
    % k2 = hf(x(k+1), yk + k1)
    % y(k+1) = yk + (k1 + k2)/2
    % k == i
    k1 = h * feval(f, x(k), y(k,:))';
    k2 = h * feval(f, x(k+1), y(k,:)+k1)';
    y(k+1,:) = y(k,:) + (k1 + k2)/2;
end
end

function [x, y] = runge4Func(f, a, b, y0, N)
%Metodo de runge para ec. de grado N
h= (b - a) / N;
x = a:h:b;
% Verifica si x es columna, de no ser lo convierte
x = x(:);
% Inicializamos el vector llenandolo de ceros
y = zeros(N+1, length(y0));%%%%%%%%%%
y(1,:) = y0;%%%%%%%%%5
for k = 1:N
    % Se transponen los vectores k1, k2, k3 y k4; k == n == i
    % k1 = hf(xk, yk)
    k1 = feval(f, x(k), y(k,:))';
    % k2 = f(xk + h/2, yk + h/2*k1)
    k2 = feval(f, x(k) + h/2, y(k,:)+((h/2)*k1))';
    % k3 = f(xk + h/2, yk + h/2*k2)
    k3 = feval(f, x(k) + h/2, y(k,:)+((h/2)*k2))';
    % k4 = f(x(k + 1) , yk + hk3)
    k4 = feval(f, x(k+1), y(k,:)+h*k3)';
    % yk + 1) = yk + (h/6)(k1 + 2k2 + 2k3 + k4)
    % �
    % ysub(k + 1) = yk + (h/6)(k1 + 2k2 + 2k3 + k4)
    y(k+1,:) = y(k,:) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    
end
end
