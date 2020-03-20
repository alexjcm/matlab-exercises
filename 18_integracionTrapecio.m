clc, clear, clearvars;
%% Integracion de un polinomio mediante regla de los trapecios compuesto
%%

a = input('Ingrese punto a: ');
b = input('Ingrese punto b: ');
N = input('Ingrese n: ');
% N=(b-a)/h
h = (b-a)/(N);
formula = 0;
%formula 
% ---> Integral desde a-b de f(x)dx = (b-a)/2n[f(X0) + 2f(X1) + 2f(X2) + ... + 2f(Xn-1) + f(Xn)]

array_resultado = [];
array_x = a:h:b;
campo01 = (b - a)/(2 * N);

for i = 1:length(array_x)
    x = array_x(i);
    
    if(i == 1 || i == length(array_x))
        formula = formula + feval('evaluarPolinomioComplejo', (x));
    else
        formula = formula + (2 * feval('evaluarPolinomioComplejo', (x)));
    end
    
    array_resultado(i, 1) = x;
    array_resultado(i, 2) = feval('evaluarPolinomioComplejo', (x));
    
end
formula = campo01 * formula;

tabla = table(array_resultado(:,1),array_resultado(:,2),'VariableNames', {'x'; 'fx'});
disp(tabla);

disp("Resultado = " +formula);

