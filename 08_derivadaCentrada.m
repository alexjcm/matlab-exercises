clc, clear, clearvars;
%% Diferencias finitas centradas de polinomios
%% Los puntos van a ambos lados del punto en el que se calcula la derivada,
% se usan puntos antes y despues del punto de interes. 
% Para compensar los efectos de la d. progresiva y de la regresiva 
% se puede promediar ambas definiciones obteniendo el operador centrado, es 
% decir se calcula la d. finita centrada.

grado = input('Ingrese grado del polinomio: ');
array_coeficientes = extraerCoeficientes(grado);

punto_a = input('Ingrese punto a: ');
punto_b = input('Ingrese punto b: ');
incremento = input('Ingrese incremento: ');
formula = 0;
% formula --->   f'(X0) = (f(X0 + h)  - f(X0 - h)) / 2h 

% 5x^4 - 2x^3 + 4x^2 -3x + 28   desde 0 a 4 con h=1 a 0.001
% 20x^3 - 6^2 + 8x - 3
array_x = punto_a:incremento:punto_b;

for i = 1 : length(array_x)
    % i es el indice
    valor_y = evaluarPolinomio(array_x(i), array_coeficientes, grado);
    
    %% Calculamos el valor de la derivada numericamente
    campo01 = evaluarPolinomio((array_x(i) + incremento), array_coeficientes, grado);
    campo02 = evaluarPolinomio((array_x(i) - incremento), array_coeficientes, grado);
    formula = (campo01 - campo02) / (2 * incremento);
    
    resultado_array(i, 1) = array_x(i); % x
    resultado_array(i, 2) = valor_y; % y
    resultado_array(i, 3) = formula; % derivada
    
end

tabla = table(resultado_array(:,1),resultado_array(:,2),resultado_array(:,3),'VariableNames', {'x'; 'y';'derivada'});
disp(tabla);
