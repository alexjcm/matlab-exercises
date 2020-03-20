clc, clear, clearvars;
%% Integracion  de un polinomio mediante regla de simpson 3/8 COMPUESTA

a = input('Ingrese punto a: ');
b = input('Ingrese punto b: ');
n = input('Ingrese n (se empieza a contar desde el 0): '); % cantidad de valores de x (del 0 al 3)

formula = 0;
% formula simpson 3/8 compuesta
% f(x)dx = 3h/8 [f(x0) + 3f(x1) + 3f(x2) + 2f(x3) + f(x4)]
h = (b - a) / n;

array_fx = [];
valores_x = a:h:b;
contador = 0;
for i = 1:length(valores_x)
    x = valores_x(i);
    if (i == 1 || i == length(valores_x))
        formula = formula  + feval('evaluarPolinomioComplejo', x);
        contador = contador + 1;
    elseif(contador == 1 || contador == 2)
        formula = formula  + 3 * feval('evaluarPolinomioComplejo', x);
        contador = contador + 1;
    elseif(contador == 3)
         formula = formula  + 2 * feval('evaluarPolinomioComplejo', x);
         contador = 1;
    end
    array_fx = [array_fx   feval('evaluarPolinomioComplejo', x)];
end

formula = ((3 * h) / 8) * formula;
disp("Resultado I = " + formula);

