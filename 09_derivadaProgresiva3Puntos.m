clc, clear, clearvars;
%% Diferencia finita progresiva en 3 puntos de un polinomio.
%%

grado = input('Ingrese grado del polinomio: ');
aux_grado = grado;
array_coeficientes = extraerCoeficientes(grado);

punto_a = input('Ingrese punto a: ');
punto_b = input('Ingrese punto b: ');
incremento = input('Ingrese incremento: ');
array_resultado = [];
formula = 0;
% formula --->   f'(X0) = (-3*f(X0) + 4*f(X0 + h) - f(x0 + 2h)) / 2h

% 5x^4 - 2x^3 + 4x^2 -3x + 28   desde 0 a 4 con h=1 a 0.001
array_x = punto_a:incremento:punto_b;
for i = 1 : length(array_x)
    x = array_x(i);
    valor_y = evaluarPolinomio(x, array_coeficientes, grado);
    
    campo_a = -3 * evaluarPolinomio(x, array_coeficientes, grado);
    campo_b = 4 * evaluarPolinomio((x + incremento), array_coeficientes, grado);
    campo_c = evaluarPolinomio((x + (2 * incremento)), array_coeficientes, grado);
    
    formula = (campo_a + campo_b - campo_c) / (2 * incremento);
    
    array_resultado(i, 1) = x;
    array_resultado(i, 2) = valor_y;
    array_resultado(i, 3) = formula;
    
end

tabla = table(array_resultado(:,1),array_resultado(:,2),array_resultado(:,3),'VariableNames', {'x'; 'y';'derivada'});
disp(tabla);

