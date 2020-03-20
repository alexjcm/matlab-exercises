function  valor_y = evaluarPolinomio(valor_x, array_coeficientes, grado)
% Evalua un polinomio en el punto x dado
array_terminos = [];

for i = 0 : grado
    coef = array_coeficientes(i + 1);
    termino = coef * power(valor_x, grado - i);
    array_terminos = [array_terminos termino];
end

% Evalua el resultado del polinomio y retorna un unico valor
valor_y = sum(array_terminos);

end


