function resultado = derivadaProgresiva(incremento, punto_x, array_coeficientes, grado)
% DERIVADAPROGRESIVA Summary of this function goes here
% formula --->   f'(X0) = (f(X0 + h)  - f(X0)) / h
campo01 = evaluarPolinomio((punto_x + incremento), array_coeficientes, grado);
campo02 = evaluarPolinomio(punto_x, array_coeficientes, grado);

resultado = (campo01 - campo02) / incremento;

end

