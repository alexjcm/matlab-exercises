clear, clc, clearvars;
% Interpolacion polinomica de Lagrange

% Formula
% P(x) = Y0L0(x) + Y1L1(x) + Y2L2(x) + ... + YnLn(x)

% grado_interpol = input('Ingrese grado de interpolaci�n: '); % 2
% valores_x = [5 6 7 8];
% valores_y = [1.023 2.051 3.025 4.036];
valores_x = [1 5/3 7/3 3];
valores_y = [1.99 1.76 1.69 1.63];
punto_x = 2.1; %punto a evaluar

n = length(valores_x);
valores_L = [];
%c = 1:n; % vector para los indices
for i = 1:n
    L = 1; 
    indices = 1:n;
    indices(i) = []; % eliminamos el iesimo elemento al vector indices para 
    % poder obtener los peque�os polinomios de Lagrange
    for j = indices        
        L = L * (punto_x - valores_x(j)) / (valores_x(i) - valores_x(j));
    end
    valores_L = [valores_L, L]; % vamos concatenado L a la lista
end

% Multiplicamos el vector  valores_y con el vector L
Px = valores_L .* valores_y;
% sumamos dicho vector resultante
Px = sum(Px);
disp('Valor de y = ');
disp(Px);

