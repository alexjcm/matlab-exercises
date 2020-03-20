clc, clear, clearvars;
%% Metodo Adams Moulton, 3 pasos(4to orden) para resolver ecuaciones diferenciales.
%%

func = @(x, y) [y(2);   -3*y(2) + 10*y(1) + 442*cos(3*x)];
a = 0;
b = 5;
y0 = [0, 1];
N = 20;

[xa2, ya2] = adams_bashforth_2_pasos(func, a, b, y0, N);
[xa3, ya3] = adams_bashforth_3_pasos(func, a, b, y0, N);
[xa4, ya4] = adams_bashforth_4_pasos(func, a, b, y0, N);
[xa4v2, ya4v2] = adams_bashforth_4_pasos_v2(func, a, b, y0, N); % version 2

table(xa3, ya2, ya3, ya4, ya4v2)

%%
function [x, y] = adams_bashforth_2_pasos(f, a, b, y0, N)
h= (b - a) / N;
x = a:h:b;
x = x(:); % Verifica si x es columna, de no ser lo convierte
y = zeros(N+1, length(y0));
y(1,:) = y0;
for k = 1:N
    % INICIALIZADOR RUNGE 4
    % k1 = hf(xk, yk)
    k1 = feval(f, x(k), y(k,:))';
    % k2 = f(xk + h/2, yk + h/2k1)
    k2 = feval(f, x(k) + (h/2), (y(k,:)+((h/2)*k1)))';
    % k3 = f(xk + h/2, yk + h/2k2)
    k3 = feval(f, x(k) + (h/2), (y(k,:)+((h/2)*k2)))';
    % k4 = f(x(k + 1) , yk + hk3)
    k4 = feval(f, x(k+1), (y(k,:)+(h*k3)))';
    % yk + 1) = yk + (h/6)(k1 + 2k2 + 2k3 + k4)
    y(k+1,:) = y(k,:) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    
    if k > 1
        % PREDICTOR
        % formula adams-bashforth 2 pasos
        % yn+1 = yn + h/2(3f(xn, yn) - f(xn-1,yn-1))
        y(k+1,:) = y(k,:) + (h/2) * (3*feval(f, x(k), y(k,:)) - feval(f, x(k-1), y(k-1,:)))';
        
        %CORRECTOR adams-moulton 2 pasos
        % yn+1 = yn + h/12(5f(xn+1, yn+1) + 8f(xn,yn) - f(xn-1,yn-1))
        y(k+1,:) = y(k,:) + (h/12)*(5*feval(f,x(k+1),y(k+1,:)) + 8*feval(f,x(k),y(k,:)) - feval(f,x(k-1),y(k-1,:)))';
        
    end
    
end
end

function [x, y] = adams_bashforth_3_pasos(f, a, b, y0, N)
h= (b - a) / N;
x = a:h:b;
x = x(:); % Verifica si x es columna, de no ser lo convierte
y = zeros(N+1, length(y0));
y(1,:) = y0;
for k = 1:N
    % INICIALIZADOR RUNGE4
    % k1 = hf(xk, yk)
    k1 = feval(f, x(k), y(k,:))';
    % k2 = f(xk + h/2, yk + h/2k1)
    k2 = feval(f, x(k) + (h/2), (y(k,:)+((h/2)*k1)))';
    % k3 = f(xk + h/2, yk + h/2k2)
    k3 = feval(f, x(k) + (h/2), (y(k,:)+((h/2)*k2)))';
    % k4 = f(x(k + 1) , yk + hk3)
    k4 = feval(f, x(k+1), (y(k,:)+(h*k3)))';
    % yk + 1) = yk + (h/6)(k1 + 2k2 + 2k3 + k4)
    y(k+1,:) = y(k,:) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    
    if k > 2
        % PREDICTOR adams-bashforth 3 pasos
        % yn+1 = yn + h/12*(23f(xn, yn) - 16f(xn-1,yn-1)+5f(xn-2, yn-2))
        y(k+1,:) = y(k,:) + (h/12) * (23*feval(f, x(k), y(k,:))  - 16*feval(f, x(k-1),y(k-1,:)) + 5*feval(f, x(k-2),y(k-2,:)))';
        
        % CORRECTOR con adams-moulton 3 pasos
        aux1=     feval(f,x(k-2), y(k-2,:));
        aux2 = 5*(feval(f,x(k-1), y(k-1,:)));
        aux3 = 19*(feval(f,x(k),  y(k,:)));
        aux4 = 9*(feval(f,x(k+1), y(k+1,:)));
        y(k+1,:) = y(k,:) + (h/24) * ( aux1 - aux2 +  aux3 + aux4)';
    end
    
end
end

% adam bashforth-moulton 4
function [x, y] = adams_bashforth_4_pasos(f, a, b, y0, N)
h= (b - a) / N;
x = a:h:b;
x = x(:); % Verifica si x es columna, de no ser lo convierte
y = zeros(N+1, length(y0));
y(1,:) = y0;
for k = 1:N
    % INICIALIZADOR RUNGE4
    % k1 = hf(xk, yk)
    k1 = feval(f, x(k),  y(k,:))';
    % k2 = f(xk + h/2,  yk + h/2k1)
    k2 = feval(f, x(k) + (h/2), (y(k,:)+((h/2)*k1)))';
    % k3 = f(xk + h/2, yk + h/2k2)
    k3 = feval(f, x(k) + (h/2), (y(k,:)+((h/2)*k2)))';
    % k4 = f(x(k + 1) , yk + hk3)
    k4 = feval(f, x(k+1), (y(k,:)+(h*k3)))';
    % yk + 1) = yk + (h/6)(k1 + 2k2 + 2k3 + k4)
    y(k+1,:) = y(k,:) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    
    if k > 3
        % PREDICTOR
        % adams-bashforth 4 pasos
        % y0, y1, y2, y3 deben ser inicializados antes de esto
        % yn+1 = yn + h/24
        % *(55*f(xn, yn) -59f(xn-1, yn-1) + 37*f(xn-2, yn-2) - 9*f(xn-3,yn-3))
        aux1 = 55 * feval(f, x(k),   y(k,:));
        aux2 = 59 * feval(f, x(k-1), y(k-1,:));
        aux3 = 37 * feval(f, x(k-2), y(k-2,:));
        aux4 = 9 *  feval(f, x(k-3), y(k-3,:));
        y(k+1,:) = y(k,:) + (h/24) * (aux1 - aux2 + aux3 - aux4)';
        
        % CORRECTOR con adams-moulton 3 pasos
        aux1=     feval(f,x(k-2), y(k-2,:));
        aux2 = 5*(feval(f,x(k-1), y(k-1,:)));
        aux3 = 19*(feval(f,x(k),  y(k,:)));
        aux4 = 9*(feval(f,x(k+1), y(k+1,:)));
        y(k+1,:) = y(k,:) + (h/24) * ( aux1 - aux2 +  aux3 + aux4)';
        
    end
    
end
end

% adam bashforth-moulton 4 (version 2)
function [x, y] = adams_bashforth_4_pasos_v2(f, a, b, y0, N)
h= (b - a) / N;
x = a:h:b;
x = x(:); % Verifica si x es columna, de no ser lo convierte
y = zeros(N+1, length(y0));
y(1,:) = y0;

for k = 1:3
    % INICIALIZADOR RUNGE4
    % k1 = hf(xk, yk)
    k1 = feval(f, x(k),  y(k,:))';
    % k2 = f(xk + h/2,  yk + h/2k1)
    k2 = feval(f, x(k) + (h/2), (y(k,:)+((h/2)*k1)))';
    % k3 = f(xk + h/2, yk + h/2k2)
    k3 = feval(f, x(k) + (h/2), (y(k,:)+((h/2)*k2)))';
    % k4 = f(x(k + 1) , yk + hk3)
    k4 = feval(f, x(k+1), (y(k,:)+(h*k3)))';
    % yk + 1) = yk + (h/6)(k1 + 2k2 + 2k3 + k4)
    y(k+1,:) = y(k,:) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
end

for k = 4:N    
    % PREDICTOR
    % adams-bashforth 4 pasos
    % y0, y1, y2, y3 deben ser inicializados antes de esto
    % yn+1 = yn + h/24
    % *(55*f(xn, yn) -59f(xn-1, yn-1) + 37*f(xn-2, yn-2) - 9*f(xn-3,yn-3))
    aux1 = 55 * feval(f, x(k),   y(k,:));
    aux2 = 59 * feval(f, x(k-1), y(k-1,:));
    aux3 = 37 * feval(f, x(k-2), y(k-2,:));
    aux4 = 9 *  feval(f, x(k-3), y(k-3,:));
    y(k+1,:) = y(k,:) + (h/24) * (aux1 - aux2 + aux3 - aux4)';
    
    % CORRECTOR con adams-moulton 3 pasos
    aux1=     feval(f,x(k-2), y(k-2,:));
    aux2 = 5*(feval(f,x(k-1), y(k-1,:)));
    aux3 = 19*(feval(f,x(k),  y(k,:)));
    aux4 = 9*(feval(f,x(k+1), y(k+1,:)));
    y(k+1,:) = y(k,:) + (h/24) * ( aux1 - aux2 +  aux3 + aux4)';
       
end
end


