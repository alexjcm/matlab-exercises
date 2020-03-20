clc, clear, clearvars;
%% Integracion de un polinomio mediante regla de simpson 3/8 SIMPLE
%% 

a = input('Ingrese punto a: ');
b = input('Ingrese punto b: ');
n = input('Ingrese n (se empieza a contar desde el 0): '); % cantidad de valores de x (del 0 al 3)
% h = (b-a) / n  % compuesta

formula = 0;
% formula simpson 3/8 simple
% f(x)dx = 3h/8 [f(x0) + 3f(x1) + 3f(x2) + f(x3)]
h = (b - a) / n;

array_fx = [];
valores_x = a:h:b;
for i = 1:length(valores_x)
    x = valores_x(i);
    if (i == 1 || i == length(valores_x))
        formula = formula  + feval('evaluarPolinomioComplejo', (x));
    else
        formula = formula  + 3 * feval('evaluarPolinomioComplejo', (x));
    end
    array_fx = [array_fx   feval('evaluarPolinomioComplejo', (x))];
end

formula = ((3 * h) / 8) * formula;
disp("Resultado I = " +formula);

