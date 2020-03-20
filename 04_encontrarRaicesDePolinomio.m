clc, clear, clearvars;
%% Encontrar las raices de un polinomio dividiendo para h (h es el incremento).
% Si no se encuentran las raices  en la primera iteracion dividir 
% para 10 el incremento y repetir el proceso. Trabajar con 10^-3 (0.001)
%%

grado = input('Ingrese grado de la ecuacion: ');
array_coeficientes = extraerCoeficientes(grado);

% 80*x^2 - 414*x^1 + 495; evaluar desde 1 a 4 

punto_a = input('Ingrese punto a: ');
punto_b = input('Ingrese punto b: ');
incremento = 1;
array_raices = [];
while (length(array_raices) ~= grado)
    array_raices = [];
    array_x = punto_a:incremento:punto_b;    
    for i = 1 : length(array_x)
        % i es el indice
        valor_y = evaluarPolinomio(array_x(i), array_coeficientes, grado);
        
        if (valor_y >= 0 && valor_y <= 0.001)         
            array_raices = [array_raices    array_x(i)];
        end
        
    end % fin for
    
    incremento = incremento / 10;
    
end

disp("Las raices correspondientes a x1 y x2 son:");
disp(array_raices);



