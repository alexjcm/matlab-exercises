clc, clear, clearvars;
%% Evalua un polinomio desde un punto a hasta un punto b
%%

grado = input('Ingrese grado del polinomio: ');
array_coeficientes = extraerCoeficientes(grado);

punto_a = -10;
punto_b = 10;
incremento = 1;
array_x = [];
array_y = [];

for valor_x = punto_a:incremento:punto_b
    %% Evalua polinomio en el punto j
    valor_y = evaluarPolinomio(valor_x, array_coeficientes, grado);    
    array_x = [array_x valor_x];
    array_y = [array_y valor_y];    
end

tabla = table(array_x(:), array_y(:),'VariableNames', {'x'; 'y'});
disp(tabla);



