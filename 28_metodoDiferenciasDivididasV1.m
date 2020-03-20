clear, clc, clearvars;
% Newton Diferencias divididas
%%

valores_x = [1 5/3 7/3 3];
valores_y = [1.99 1.76 1.69 1.63];
punto_x = 2.1; % 1.7056

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
        % diferencia finita
        divisor = valores_x(i) - valores_x(i-1);
        aux = aux / divisor;
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


