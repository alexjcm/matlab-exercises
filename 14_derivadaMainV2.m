clc, clear;
%% Derivada numerica de 2 y de 3 puntos para polinomios complejos con el método feval
%%
disp('*****  DERIVACION NUMERICA CON FEVAL() *****')
punto_a = 0;
punto_b = 2;
incremento = 0.1;

array_resultado = [];
array_x = punto_a:incremento:punto_b;

for i = 1:length(array_x)
    x = array_x(i);    
 
    progresiva_2_puntos = derivadaProgresivaV2(incremento, x);    
    progresiva_3_puntos = derivadaProgresiva3PuntosV2(incremento, x);   
    centrada_2_puntos = derivadaCentradaV2(incremento, x);    
    centrada_3_puntos = derivadaCentrada3PuntosV2(incremento, x);   
    regresiva_2_puntos = derivadaRegresivaV2(incremento, x);  
    regresiva_3_puntos = derivadaRegresiva3PuntosV2(incremento, x);
    
    array_resultado(i, 1) = x;
    array_resultado(i, 2) = progresiva_2_puntos;
    array_resultado(i, 3) = progresiva_3_puntos;
    array_resultado(i, 4) = centrada_2_puntos;
    array_resultado(i, 5) = centrada_3_puntos;
    array_resultado(i, 6) = regresiva_2_puntos;
    array_resultado(i, 7) = regresiva_3_puntos;
    
end

tabla = table(array_resultado(:,1), array_resultado(:,2), array_resultado(:,3),array_resultado(:,4), array_resultado(:,5), array_resultado(:,6), array_resultado(:,7));
tabla.Properties.VariableNames = {'x'; 'Progre2'; 'Progre3'; 'Centrada2'; 'Centrada3'; 'Regres2'; 'Regres3'};
disp(tabla);
