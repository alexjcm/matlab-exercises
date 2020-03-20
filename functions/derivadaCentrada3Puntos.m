function resultado = derivadaCentrada3Puntos(incremento, punto_x, array_coeficientes, grado)
% DERIVADACENTRADA3PUNTOS Summary of this function goes here
% formula --->   f'(X0) = (f(X0 - 2h)  - 8*f(X0 - h) + 8*f(x0 + h) - f(x0 + 2h) / 12h

campo01 = evaluarPolinomio((punto_x - (2*incremento)), array_coeficientes, grado);
campo02 = 8 * evaluarPolinomio((punto_x - incremento), array_coeficientes, grado);
campo03 = 8 * evaluarPolinomio((punto_x + incremento), array_coeficientes, grado);
campo04 = evaluarPolinomio((punto_x + (2*incremento)), array_coeficientes, grado);

resultado = (campo01 - campo02 + campo03 - campo04) / (12 * incremento);

end

