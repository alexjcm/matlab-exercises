clc, clear, clearvars;
%% Integracion con Newton-Cotes
%

a = 0;
b = 1;
n = 4; 

% FORMULAS
% punto medio
% A = h (altura(0) + altura(1) +... altura(n))
h = (b - a) / n;
aux_medio = h / 2;

valores_x = a:h:b;
punto_medios = [];
alturas = [];
fx = 0;
disp("Punto medio");
for i = 1 : length(valores_x) - 1
    x = valores_x(i);
    punto_medios = [punto_medios   (x + aux_medio)];
    alturas = [alturas    feval('evaluarPolinomioComplejo', punto_medios(i))];
    fx = fx + alturas(i);
end
fx = h * fx;
disp(fx);

disp("Boole");
% boole
% f(x) = (2h / 45) * [7f(x0) + 32f(x1) + 12f(x2) + 32f(x3) + 7f(x4)]
fx2 = 0;
contador = 0;
formula = 0;
aux = [];
for i = 1:length(valores_x)
    x = valores_x(i);
    if (i == 1 || i == length(valores_x))
        formula = formula  + (7 * feval('evaluarPolinomioComplejo', (x)));
        contador = 1;
    elseif(contador == 1)
        formula = formula  + (32 * feval('evaluarPolinomioComplejo', (x)));
        contador = 0;
    elseif(contador == 0)
        formula = formula  + (12 * feval('evaluarPolinomioComplejo', (x)));
        contador = 1;
    end
end
formula = (2*h / 45) * formula;
disp(formula);



