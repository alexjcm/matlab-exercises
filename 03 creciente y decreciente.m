clc, clear;
syms x;
grado = input('Ingrese grado del polinomio: ');
polinom = 0;
for i = 0:grado
    coeficiente = input(['Ingrese coeficiente de x^', int2str(grado), ': ']);
    polinom = polinom + coeficiente*x^grado;
    grado = grado - 1;
end

resultado_array = [];
num_fila = 1;
punto_a = -10;
punto_b = 10;
incremento = input('Ingrese incremento: ');

creciente = [];
bool_dec = 1;
decreciente = [];
bool_cre = 1;

for j = punto_a:incremento:punto_b
    x = j; 
    valor_y = eval(polinom);
    resultado_array(num_fila, 1) = x;
    resultado_array(num_fila, 2) = valor_y;
        
    if (num_fila > 1)
        valor_y_old = resultado_array(num_fila - 1, 2);
        if (valor_y_old > valor_y)
            if(bool_cre == 0)
                disp(strcat("Es Creciente Hasta " + valor_y_old));
                bool_cre = 1;
            end
            if (bool_dec == 1)
                disp(strcat("Es decreciente desde " + valor_y_old));
                bool_dec = 0; 
            end
        else
            if (bool_dec == 0)
                disp(strcat("Es decreciente Hasta " + valor_y_old));
                bool_dec = 1;
            end
            if (bool_cre == 1)
                disp(strcat("Es Creciente desde " + valor_y_old));
                bool_cre = 0; 
            end
        end
    end    
    num_fila = num_fila + 1;
end

if(bool_cre == 0)
    disp(strcat("Es Creciente Hasta " + valor_y));
end
if (bool_dec == 0)
    disp(strcat("Es decreciente Hasta " + valor_y));
end

display(resultado_array);

