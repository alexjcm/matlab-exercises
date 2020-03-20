clc, clear;
%% Derivada numerica de 2 y de 3 puntos de polinomios simples
%%

disp('******  DERIVACION NUMERICA  ******');
grado = input('Ingrese grado de la ecuacion: ');
array_coeficientes = extraerCoeficientes(grado);
punto_a = 0;
punto_b = 1;
incremento = 0.01;
array_resultado = [];
array_x = punto_a:incremento:punto_b;

for i = 1:length(array_x)
    x = array_x(i);
       
    progresiva_2_puntos = derivadaProgresiva(incremento, x, array_coeficientes, grado);   
    progresiva_3_puntos = derivadaProgresiva3Puntos(incremento, x, array_coeficientes, grado);    
    centrada_2_puntos = derivadaCentrada(incremento, x, array_coeficientes, grado);    
    centrada_3_puntos = derivadaCentrada3Puntos(incremento, x, array_coeficientes, grado);   
    regresiva_2_puntos = derivadaRegresiva(incremento, x, array_coeficientes, grado);     
    regresiva_3_puntos = derivadaRegresiva3Puntos(incremento, x, array_coeficientes, grado);
    
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
