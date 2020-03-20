clc, clear, clearvars;
%% Derivada normal de un polinomio, es decir sin evaluaro numeriamente.
%%

syms x;
grado = input('Ingrese grado del polinomio: ');
aux_grado = grado;
polinom = 0;
array_coeficientes = extraerCoeficientes(grado);
aux_coeficientes = [];

%%
% Concatenamos la variable con coeficientes, en este caso para
% presesentarlos en pantala.
grado = aux_grado;
for i = 1:grado + 1
    polinom = polinom + array_coeficientes(i)*x^grado;
    grado = grado -1;
end
disp("Funcion original:");
disp(polinom);
grado = aux_grado;
polinom = 0;
%%

seguir_operando ='y';
num_derivada = 1;

while seguir_operando == 'y'
    % Derivacion
    for i = 1:grado+1
        aux_coeficientes(i)  = array_coeficientes(i) * grado; % Recuperamos los nuevos coeficientes
        polinom = polinom + array_coeficientes(i) * grado * x^(grado-1); % Derivamos
        grado = grado - 1;
    end
    %
    array_coeficientes = aux_coeficientes; % Guardamnos los nuevos coeficientes en el arreglo anterior
    aux_coeficientes = []; 
    grado = aux_grado - 1; % Restamos 1 grado cada vez que derivamos 
    aux_grado = grado; % Actualizamos la variable
    %
    disp(strcat("DERIVADA ", string(num_derivada) , ": "));
    disp(polinom);
    %%
    if(polinom == 0)
        disp("Ya no se puede seguir derivando!");
        break;
    end
    
    seguir_operando = input('Desea seguir derivando? Y/n: ','s');
    if lower(seguir_operando) == 'y'
        seguir_operando = "y";
    elseif lower(seguir_operando) == 'n'
        break;
    else
        disp("Ha seleccionado una opcion incorrecta.");
    end
    %%
    polinom = 0; % Reseteamos la variable
    num_derivada = num_derivada + 1;
    
end
