clear, clc, clearvars;
% Interpolacion Newton hacia adelante
%%

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
