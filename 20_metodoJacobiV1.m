clear, clc;
%% Motodo iterativo Jacobi, para resolucion de sistemas de ecuaciones
%%

A = [4 -1 0 0;
    -1 4 -1 0;
    0 -1 4 -1;
    0 0 -1 4];

b = [1 1 1 1];

% Ejemplo con diagonal no mayor
% A = [4 5 0 0;
%     7 4 -1 0;
%     0 -1 9 -1;
%     0 6 -1 4];
%b = [1 1 1 1];

% A=L+D+U;
% X(k+1) = -D^-1(L+U)Xsub(k) + D^-1 * b

% inv
% diag(diag(A))
% tril(A,-1)
% triu(A,+1)

X0 = zeros(1, 4); % Un cero por cada variable independiente
iteracion = 1;
Error = 1;

while Error > 0.0001
    
    for i = 1:4
        suma = 0;
        for j = 1:4
            if i ~= j
                suma = suma + A(i, j) * X0(j);
            end
        end
        X(i) = (b(i) - suma) / A(i, i);
        arr_result(iteracion, (i+1)) = X(i);
        
    end
    
    arr_result(iteracion, 1) = iteracion;
    
    % Calculamos el error OPCION 1
    % Error = norm(X0 - X); % vector anterior - vector actual
    % Calculamos el error OPCION 2
    Error = abs(((X - X0)/X));    
    X0 = X; % asignamos a X0 el contenido del vector X
    
    if iteracion > 25
        break
    end
    
    iteracion = iteracion + 1;
    
end

tabla = table(arr_result(:,1),arr_result(:,2),arr_result(:,3),arr_result(:,4),arr_result(:,5),'VariableNames', {'K'; 'x1';'x2';'x3';'x4'});
disp(tabla);


