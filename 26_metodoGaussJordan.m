clear, clc;
%% Metodo de Gauss-Jordan para resolver sistemas de ecuaciones
%%

% Matriz aumentada que representa un sistema de ecuaciones lineales
% donde los valores que van luego del igual estan en la ultima columna
A = [2 -1 0 0 0;
    -1 2 -1 0 0;
    0 -1 2 -1 0;
    0 0 -1 2 5];

% Obtenemos el numero de filas y columnas de la matriz
[num_filas, num_col] = size(A);

for i = 1 : num_filas-1
     % Realizamos el pivoteo
    for j = 2 : num_filas
        if A(i, i) == 0
            t=A(1,:);A(1,:)=A(j,:);
            A(j,:)=t;
        end
    end
     % Convertimos los elementos bajo la diagonal principal en ceros
    for k = i+1 : num_filas
        A(k,:) = A(k,:)-A(i,:)*(A(k,i) / A(i,i));
    end
end

% Convertimos los elementos sobre la diagonal principal en ceros
for i = num_filas : -1:2
    for j = i-1 : -1 : 1
        A(j,:) = A(j,:)-A(i,:)*(A(j,i) / A(i,i));
    end
end


% Iniciaizamos con ceros un vector el cual contendra la sol. a cada variable
soluciones = zeros(1, num_filas);
% Convertimos los elementos de la diagonal principal en unos

for i = 1 : num_filas
    A(i,:) = A(i,:) / A(i,i);
    soluciones(i) = A(i,num_col);
end

disp('A =');
disp(A);
disp("Solucion =");
disp(soluciones);