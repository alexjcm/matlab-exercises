clear, clc;
%% Metodo iterativo Jacobi, para resolucion de sistemas de ecuaciones
%%

X0 = zeros(1, 4); %En este caso un cero por cada variable independiente

A = [10 -1 2 0;
    -1 11 -1 3;
    2 -1 10 -1;
    0 3 -1 8];

b = [6 25 -11 15];

% Ejemplo con diagonal no mayor
% A = [4 5 0 0;
%     7 4 -1 0;
%     0 -1 9 -1;
%     0 6 -1 4];
%b = [1 1 1 1];

% A=L+D+U;
% X(k+1) = -D^-1(L+U)Xsub(k) + D^-1 * b
Dinv = inv(diag(diag(A))); %D^-1
L = tril(A,-1); % L diagonal triangular inferior
U = triu(A,+1); % U diagonal triangular superior

%x=((-dinv.*(l+u).*xin)+(dinv.*b));
%X = ((-Dinv.*(L + U).*X0) + (Dinv.*b));

iteracion = 1;
error = 1;

while error > 0.0001    
    for i = 1:2
        %for j = 1:4
            X = ((-Dinv*(L + U).*X0) + (Dinv.*b)); % es una matriz             
            X0 = transpose(diag(X));% es un vector
            disp(X0);
            %0.600000000000000   2.272727272727273  -1.100000000000000   1.875000000000000
       % end
    end
    % Calculamos el error
    error = norm(X0 - X); % vector anterior - vector actual     
   % X0 = X; % asignamos a X0 el contenido del vector X
    
    if iteracion > 2
        break
    end
    
    iteracion = iteracion + 1;
    
end

%tabla = table(arr_result(:,1),arr_result(:,2),arr_result(:,3),arr_result(:,4),arr_result(:,5),'VariableNames', {'K'; 'x1';'x2';'x3';'x4'});
%

