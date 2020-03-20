function resultado = derivadaRegresiva3Puntos(incremento, punto_x, array_coeficientes, grado)
% formula --->   f'(X0) = (f(X0 - 2h)  - 4*f(X0 - h) + 3*f(x0)) / 2h

campo01 = evaluarPolinomio((punto_x - (2 * incremento)), array_coeficientes, grado);
campo02 = 4 * evaluarPolinomio((punto_x - incremento), array_coeficientes, grado);
campo03 = 3 * evaluarPolinomio(punto_x, array_coeficientes, grado);

resultado = (campo01 - campo02 + campo03) / (2 * incremento);

end
