clear, clc;
%% Metodo iterativo Raphson para resolver funciones.
%%

disp('Metodo de Newton Raphson.')
syms x;
f=inline(68*x^5 + 5*x^4 - 22*x^3 + 13*x^2 - 102*x + 66);
d=inline(340*x^4 + 20*x^3 - 66*x^2 + 26*x - 102);

x0 = 2;
err = 0.001;
err_abs = 100;
iteracion = 0;

while err_abs > err      
    %Aproximamos la raiz con la formula correpondiente
    x = x0 - (f(x0) / d(x0));    
    
    %Calculamos el porcentaje de error
    %err_abs = abs(((x - x0) / x) * 100);
    err_abs = abs(x - x0);
    x0 = x;
    
    iteracion = iteracion + 1;
end

%Mostramos los resultados en pantalla (con 4 decimales)
fprintf('\nRaiz= %10.4f en %d Iteraciones', x0, iteracion);


