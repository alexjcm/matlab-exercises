function resultado = derivadaCentrada(incremento, punto_x, array_coeficientes, grado)
% DERIVADACENTRADA Summary of this function goes here
% formula --->   f'(X0) = (f(X0 + h)  - f(X0 - h)) / 2h  

campo01 = evaluarPolinomio((punto_x + incremento), array_coeficientes, grado);
campo02 = evaluarPolinomio((punto_x - incremento), array_coeficientes, grado);

resultado = (campo01 - campo02) / (2 * incremento);

end

