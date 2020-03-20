function resultado = derivadaRegresiva(incremento, punto_x, array_coeficientes, grado)
% DERIVADAREGRESIVA Summary of this function goes here
% formula --->   f'(X0) = (f(X0)  - f(X0 - h)) / h

campo01 = evaluarPolinomio(punto_x, array_coeficientes, grado);
campo02 = evaluarPolinomio((punto_x - incremento), array_coeficientes, grado);

resultado = (campo01 - campo02) / incremento;

end

