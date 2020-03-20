clear, clc, clearvars;
% Newton Diferencias divididas V2
%%

valores_x = [1 1.5 1.9 2.2 2.4];
valores_y = [0.33 0.85 1.13 1.31 1.41];
punto_x = 2; % 1.1928

pol_newton(valores_x, valores_y, punto_x);
[Gx, def, b] = pol_newton(valores_x, valores_y, punto_x);

function [Gx, pol, b] = pol_newton(valores_x, valores_y, punto_x)
n = length(valores_x);
b = zeros(n);
b(:,1) = valores_y(:);

% obtener tabla de diferencias
for j = 2 : n
    for i = 1:n - j + 1
        b(i, j) = (b(i + 1, j - 1) -b(i, j - 1)) / (valores_x(i+j-1) - valores_x(i)) ;
    end
    
end

% calcular el dato interpolado
xt = 1;
Gx = b(1, 1);
for j = 1:length(valores_x) - 1
    xt = xt .* (punto_x - valores_x(j));
    Gx = Gx + b(1, j+i) * xt;
end

% construir el polinomio
pol = num2str(b(1, 1));
xx = valores_x *-1;
for j = 2:n
    signo = '';
    if(b(1, j) >= 0)
        signo = '+';
    end
    xt = '';
    for i = 1:j-1
        signo2 = '';
        if xx(i) >= 0
            signo2 = 'x';
        end
        xt = strcat(xt, '*(x', signo2, num2str(xx(i)),')');
    end
    pol = strcat(pol, signo, num2str(b(1, j)), xt);
end

end