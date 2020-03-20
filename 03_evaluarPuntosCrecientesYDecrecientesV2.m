clc, clear, clearvars;
%% Verifica en que rango de puntos una función es creciente o decreciente
%%

grado = input('Ingrese grado del polinomio: ');
array_coeficientes = extraerCoeficientes(grado);

%Evalua un polinomio desde un punto a hasta un punto b
punto_a = input('Ingrese punto A:');
punto_b = input('Ingrese punto B:');
incremento = input('Ingrese incremento: ');
bool_dec = 1;
bool_cre = 1;
array_x = [];
array_y = [];
num_fila = 1;

% 2x^3 + 7x^2 + 3x + 1  crec-dec-crec
%-2x^3 + 4x^2 + 3x + 2  dec-crec-dec
%         x^2 + 3x + 1  dec-crec
%        -x^2 + 2x - 2  crec-dec

for valor_x = punto_a:incremento:punto_b    
    valor_y = evaluarPolinomio(valor_x, array_coeficientes, grado);    
    array_x = [array_x   valor_x];
    array_y = [array_y   valor_y];
    
    % Verificamos en que intervalos la funcion es creciente o decreciente
    if (num_fila > 1)
        %valor_y_anterior = array_resultado(num_fila - 1, 2);
        valor_y_anterior = array_y(num_fila - 1);
        if (valor_y_anterior > valor_y)
            if(bool_cre == 0)
                disp(strcat("Es Creciente Hasta " + valor_y_anterior));
                bool_cre = 1;
            end
            if (bool_dec == 1)
                disp(strcat("Es decreciente desde " + valor_y_anterior));
                bool_dec = 0; % Desactivamos para no volver a entrar
            end
        else
            if (bool_dec == 0)
                disp(strcat("Es decreciente Hasta " + valor_y_anterior));
                bool_dec = 1;
            end
            if (bool_cre == 1)
                disp(strcat("Es Creciente desde " + valor_y_anterior));
                bool_cre = 0; % Desactivamos para no volver a entrar
            end
        end
    end
       num_fila  = num_fila + 1;
end

if(bool_cre == 0)
    disp(strcat("Es Creciente Hasta " + valor_y));
end
if (bool_dec == 0)
    disp(strcat("Es decreciente Hasta " + valor_y));
end

tabla = table(array_x(:), array_y(:),'VariableNames', {'x'; 'y'});
disp(tabla);


