clear, clc, clearvars;
% Interpolacion Newton hacia atras
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
s = (punto_x - valores_x(length(valores_x))) / h;

% Formula
% N = Nambla
% g(x) =
% N0 + N1*s + N2*s(s+1) / 2! + N3*s(s+1)(s+2) / 3!
% s = (punto_x - xn) / h
valores_N = [];
N = [];
N = [N   valores_y(length(valores_y))];
% Obtenemos los valores de N
while (length(valores_y) > 1)
    for i = 2:length(valores_y)
        aux = valores_y(i) - valores_y(i - 1);
        valores_N = [valores_N   aux];
    end
    valores_y = valores_N;
    valores_N = [];
    N = [N   valores_y(length(valores_y))];
end
disp("Valores de N =");
disp(N);


% Evaluamos en la formula
Gx = N(1) + N(2) * s;
for i = 3:length(N)
    S = N(i) * s;
    aux = 1;
    for j = 1:i-2
        aux = aux * (s + j);
    end
    Gx = Gx + S * aux / factorial(i-1);
end
disp("Gx = ");
disp(round(Gx, 6));
fprintf(string(Gx));
