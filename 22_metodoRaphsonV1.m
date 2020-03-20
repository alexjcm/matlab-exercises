clc, clear, clearvars;
%% Metodo iterativo Raphson para resolver funciones.
%%

array_resultado = [];

% Formula
% X(n + 1) = Xn - f(Xn) / f'(Xn)   ;   f'(Xn != 0)
x0 = 2;

err = 0.001;
err_abs = 1;
iteracion = 0;
while err_abs > err
    array_resultado(iteracion+1, 1) = iteracion;
    array_resultado(iteracion+1, 2) = x0;
    evaluacion_x = feval('evaluarPolinomioComplejo', x0);
    derivada_x = feval('derivadaPolinomioComplejo', x0);
    x = x0 - (evaluacion_x / derivada_x);
    if iteracion < 1
        array_resultado(iteracion+1, 3) = 0;
    else
        err_abs = abs(x - x0);
        array_resultado(iteracion+1, 3) = err_abs;
    end
    
    x0 = x;
    iteracion = iteracion + 1;
    
end

tabla = table(array_resultado(:,1),array_resultado(:,2),array_resultado(:,3),'VariableNames', {'iteracion'; 'x';'err_abs'});
disp(tabla);
