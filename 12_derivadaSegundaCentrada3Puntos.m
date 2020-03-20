clc, clear, clearvars;
%% Segunda derivada en diferencias finitas centradas en 3 puntos de un polinomio.
%%

punto_a = input('Ingrese punto a: ');
punto_b = input('Ingrese punto b: ');
h = input('Ingrese incremento: ');
array_resultado = [];
formula = 0;
% formula
%  f''(X0) = -f(x0 - 2h) + 16f(x0 - h) - 30f(x0) + 16f(x0 + h) - f(x0 + 2h) / 12*h^2

array_x = punto_a:h:punto_b;
for i = 1 : length(array_x)
    x = array_x(i);
    
    campo_a = feval('evaluarPolinomioComplejo', (x - (2*h)));
    campo_b = 16 * feval('evaluarPolinomioComplejo', (x - h));
    campo_c = 30 * feval('evaluarPolinomioComplejo', x);
    campo_d = 16 * feval('evaluarPolinomioComplejo', (x + h));
    campo_e = feval('evaluarPolinomioComplejo', (x + (2*h)));
    
    formula = (-campo_a + campo_b - campo_c + campo_d - campo_e) / (12 * power(h, 2));
    
    array_resultado(i, 1) = x;
    array_resultado(i, 2) = formula;    
    
end

tabla = table(array_resultado(:,1),array_resultado(:,2),'VariableNames', {'x'; 'segundaDerivada'});
disp(tabla);

