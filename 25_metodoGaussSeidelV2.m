clear, clc ;
% Metodo de Gauss-Seidel para resolver sistemas de ecuciones.

A = [2 4 8;
    5 9 2;
    2 6 11];
b = [-4 -70 -16];

error_x = 1;
X0 = zeros(1, length(A));
X = X0;
iteracion = 1;
numero_max_iteraciones = 100;
% Con error de 10^-4 se llega a 21 iteraciones

while error_x >= 0.0001
    for i = 1 : length(A)
        suma_x = 0;
        for j = 1 : length(A)
            if i ~= j
                suma_x = suma_x + A(i, j) * X(j);
            end
        end
        X(i) = (b(i) - suma_x) / A(i, i);
        arr_result(iteracion, (i + 1)) = X(i);
    end
    % Calculamos el error con la norma
    % error_x = norm(X0 - X); % vector anterior - vector actual
    % Calculamos el error porcentual
    error_x = abs(((X - X0) / X));
    X0 = X;
    
    arr_result(iteracion, 1) = iteracion;
    arr_result(iteracion, (length(A) + 2)) = error_x;% sumamos 2 porque las columnas
    % anteriores estan ocupadas por los valores de las x
    
    if iteracion > numero_max_iteraciones
        fprintf("Se ha llegado al maximo numero de iteraciones que es%10.0f:\n", 20);
        break
    end
    iteracion = iteracion + 1;
    
end

disp(arr_result);


for i = 1: (length(A) + 2)
    if(i == 1)
        var_names(i) =  strcat('Iteracion', string(i));        
    elseif (i == (length(A) + 2))
        var_names(i) =  strcat('Error');        
    else
        var_names(i) =  strcat('X', string(i-1));        
    end
end

tabla = table(arr_result(:,1),arr_result(:,2),arr_result(:,3),arr_result(:,4),arr_result(:,5),'VariableNames', cellstr(var_names));
disp(tabla);
