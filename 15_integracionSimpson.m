clc, clear, clearvars;
%% Integracion de un polinomio mediante regla de simpson
%%

a = input('Ingrese punto a: ');
b = input('Ingrese punto b: ');
N = input('Ingrese n: ');
% N=(b-a)/h
h = (b-a)/(N);
formula = 0;

% formula --->
% Integral desde a-b de f(x)dx = (b-a)/3n[f(X0) + 4f(X1) + 2f(X2) + 4f(X1) + ... + 4f(Xn-1) + f(Xn)]

array_x = a:h:b;
campo01 = (b - a)/(3 * N);

for i = 1:length(array_x)
    x = array_x(i);
    
    if(i == 1 || i == length(array_x))
        formula = formula + feval('evaluarPolinomioComplejo', (x));
    elseif(mod(i,2) == 0)
        formula = formula + (4 * feval('evaluarPolinomioComplejo', (x)));
    else
        formula = formula + (2 * feval('evaluarPolinomioComplejo', (x)));
    end
    
end

formula = campo01 * formula;
disp("Resultado = " +formula);

