function resultado = derivadaProgresiva3Puntos(incremento, punto_x, array_coeficientes, grado)
%DERIVADAPROGRESIVA3PUNTOS Summary of this function goes here
% formula --->   f'(X0) = (-3*f(X0) + 4*f(X0 + h) - f(x0 + 2h)) / 2h

campo_a = -3 * evaluarPolinomio(punto_x, array_coeficientes, grado);
campo_b = 4 * evaluarPolinomio((punto_x + incremento), array_coeficientes, grado);
campo_c = evaluarPolinomio((punto_x + (2 * incremento)), array_coeficientes, grado);

resultado = (campo_a + campo_b - campo_c) / (2 * incremento);

end

