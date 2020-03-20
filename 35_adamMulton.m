clc, clear clearvars;
%% Metodo Adams Moulton, 3 pasos(4to orden) para resolver ecuaciones diferenciales.
%%

% y0     y inicial
% y1     calcular con runge4
% y2     calcular con runge4
% y3     de aqui en adelante con adams-moulton3
% ya que: y0=n0, y1=n1, y2=n2
% pero en este caso usare runge 4 para calcular y0, y1, y2 y a partir de y4
% se calcular� on adams-moulton de 3 pasos

func = @(x, y) [y(2);   -3*y(2) + 10*y(1) + 442*cos(3*x)];
a = 0;
b = 5;
y0 = [0, 1];
N = 20;

[xa2, ya2] = adams_moulton_2_pasos(func, a, b, y0, N);
[xa3, ya3] = adams_moulton_3_pasos(func, a, b, y0, N);
[xa4, ya4] = adams_moulton_4_pasos(func, a, b, y0, N);

table(xa3, ya2, ya3, ya4)

%%
function [x, y] = adams_moulton_2_pasos(f, a, b, y0, N)
h= (b - a) / N;
x = a:h:b;
x = x(:); % Verifica si x es columna, de no ser lo convierte
y = zeros(N+1, length(y0));
y(1,:) = y0;
for k = 1:N
    % PREDICTOR
    % k1 = f(xk, yk)
    k1 = feval(f, x(k), y(k,:))';
    % k2 = f(xk + h/2, yk + h/2k1)
    k2 = feval(f, x(k) + (h/2), (y(k,:)+((h/2)*k1)))';
    % k3 = f(xk + h/2, yk + h/2k2)
    k3 = feval(f, x(k) + (h/2), (y(k,:)+((h/2)*k2)))';
    % k4 = f(x(k + 1) , yk + hk3)
    k4 = feval(f, x(k+1), (y(k,:)+(h*k3)))';
    % yk + 1) = yk + (h/6)(k1 + 2k2 + 2k3 + k4)
    y(k+1,:) = y(k,:) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    
    % CORRECTOR
    if k > 1
        % formula adams-moulton 2 pasos
        % yn+1 = yn + h/12(5f(xn+1, yn+1) + 8f(xn,yn) - f(xn-1,yn-1))
        y(k+1,:) = y(k,:) + (h/12)*(5*feval(f,x(k+1),y(k+1,:)) + 8*feval(f,x(k),y(k,:)) - feval(f,x(k-1),y(k-1,:)))';
        
    end
    
end
end

function [x, y] = adams_moulton_3_pasos(f, a, b, y0, N)
h= (b - a) / N;
x = a:h:b;
x = x(:); % Verifica si x es columna, de no ser lo convierte
y = zeros(N+1, length(y0));
y(1,:) = y0;
for k = 1:N
    
    % PREDICTOR
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
    
    % CORRECTOR
    if k > 2
        % formula adams-moulton 3 pasos
        % yn+1 =
        % yn + h/24(f(xn-2, yn-2) - 5f(xn-1, yn-1) + 19f(xn, yn) + 9f(xn+1, yn+1))
        aux1=     feval(f,x(k-2), y(k-2,:));
        aux2 = 5*(feval(f,x(k-1), y(k-1,:)));
        aux3 = 19*(feval(f,x(k),  y(k,:)));
        aux4 = 9*(feval(f,x(k+1), y(k+1,:)));
        y(k+1,:) = y(k,:) + (h/24) * ( aux1 - aux2 +  aux3 + aux4)';
    end
    
end
end

function [x, y] = adams_moulton_4_pasos(f, a, b, y0, N)
h= (b - a) / N;
x = a:h:b;
x = x(:); % Verifica si x es columna, de no ser lo convierte
y = zeros(N+1, length(y0));
y(1,:) = y0;
for k = 1:N
    % PREDICTOR
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
    
    % CORRECTOR
    if k > 3
        % formula adams-moulton 4 pasos
        % y0, y1, y2, y3 deben ser inicializados antes de esto
        % yn+1 = yn + h/720
        % *(251*f(xn+1, yn+1) + 646f(xn, yn) - 246*f(xn-1, yn-1) + 106*f(xn-2, yn-2) - 19*f(xn-3,yn-3))
        aux1 = 251 * feval(f, x(k+1), y(k+1,:));
        aux2 = 646 * feval(f, x(k),   y(k,:));
        aux3 = 246 * feval(f, x(k-1), y(k-1,:));
        aux4 = 106 * feval(f, x(k-2), y(k-2,:));
        aux5 = 19 *  feval(f, x(k-3), y(k-3,:));
        y(k+1,:) = y(k,:) + (h/720) * (aux1 + aux2 - aux3 + aux4 - aux5)';
    end
    
end
end



