clear, clc, clearvars;
% Interpolacion Newton hacia adelante
%%

% valores_x = [0.2 0.8 1.4 2 2.6 3.2 3.8];
% valores_y = [1.978 10.048 27.622 54.7 91.282 137.368 192.958];
% punto_x = 1.9; % 49.527
valores_x = [0.1860 2.7860 5.3860 7.9860 10.5860 13.1860 15.7860];
valores_y = [1.9718 6.2661 26.5925 73.4964 157.5236 289.2196 479.1299];
punto_x = 24;

h = [];
% Verificar si hay la misma h entre cada vlor de x
for i = 2:length(valores_x)
    h = [h   valores_x(i) - valores_x(i - 1)];
end
disp("Valores de h");
disp(h);

bool_h = 1;
for i = 2:length(h)
    if(eq(num2str(h(i)), num2str(h(i - 1))))
    else
        bool_h = 0;
    end
end

if(bool_h == 0)
    disp("Los valores de h son diferentes");
end
%%

h = h(1);
s = (punto_x - valores_x(1)) / h;
% Formula
% D = Delta
% g(x) =
% D0 + D1*s + (D2*s(s-1)/2! + D3*s(s-1)(s-2)/3!)
% s = (punto_x - x1) / h
valores_D = [];
D = [];
D = [D   valores_y(1)];
% Obtenemos los valores de delta
while (length(valores_y) > 1)
    for i = 2:length(valores_y)
        aux = valores_y(i) - valores_y(i - 1);
        valores_D = [valores_D   aux];
    end
    valores_y = valores_D;
    valores_D = [];
    D = [D   valores_y(1)];
end
disp("valores de  D");
disp(D);

% Evaluamos en la formula
Gx = D(1) + D(2) * s;
for i = 3:length(D)
    S = D(i) * s;
    aux = 1;
    for j = 1:i-2
        aux = aux * (s - j);
    end
    Gx = Gx + S * aux / factorial(i-1);
end
disp("Gx = ");
disp(Gx);

% D2 = [0.9975 -0.01987 -0.01929  0.00118   0.00052 -0.000030000000001];
% g2 = D2(1) + D2(2)*s + D2(3)*s*(s-1)/factorial(2) + D2(4)*s*(s-1)*(s-2)/factorial(3) + D2(5)*s*(s-1)*(s-2)*(s-3)/factorial(4) + D2(6)*s*(s-1)*(s-2)*(s-3)*(s-4)/factorial(5);
% disp(g2);
% D2 = [1.990000000000000  -0.230000000000000   0.160000000000000  -0.150000000000000];
% g2 = D2(1) + D2(2)*s + D2(3)*s*(s-1)/factorial(2) + D2(4)*s*(s-1)*(s-2)/factorial(3);
% disp(g2);


