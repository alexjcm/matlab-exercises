clc, clear, clearvars;
%% Diferencia finita regresiva de polinomios
%% Los puntos van hacia atras, se usan puntos anteriores al punto de interes
% y nos acercaremos por la derecha

grado = input('Ingrese grado del polinomio: ');
array_coeficientes = extraerCoeficientes(grado);

punto_a = input('Ingrese punto a: ');
punto_b = input('Ingrese punto b: ');
incremento = input('Ingrese incremento: ');
formula = 0;
% formula --->   f'(X0) = (f(X0)  - f(X0 - h)) / h

% 5x^4 - 2x^3 + 4x^2 -3x + 28   desde 0 a 4 con h=1 a 0.001
array_resultado = [];
array_x = punto_a:incremento:punto_b;

for i = 1 : length(array_x)  
    % i es el indice      
    %% Calculamos el valor de la derivada numericamente 
    campo01 = evaluarPolinomio(array_x(i), array_coeficientes, grado);        
    campo02 = evaluarPolinomio((array_x(i) - incremento), array_coeficientes, grado);    
    formula = (campo01 - campo02) / incremento;
    
    array_resultado(i, 1) = array_x(i); % x
    array_resultado(i, 2) = campo01; % y
    array_resultado(i, 3) = formula; % derivada  
    
end

tabla = table(array_resultado(:,1),array_resultado(:,2),array_resultado(:,3),'VariableNames', {'x'; 'y';'derivada'});
disp(tabla);