function resultado = derivadaProgresiva3PuntosV2(incremento, x)
% formula --->   f'(X0) = (-3*f(X0) + 4*f(X0 + h) - f(x0 + 2h)) / 2h

campo_a = -3 * feval('evaluarPolinomioComplejo', x);
campo_b = 4 * feval('evaluarPolinomioComplejo', (x + incremento));
campo_c = feval('evaluarPolinomioComplejo', (x + (2 * incremento)));

resultado = (campo_a + campo_b - campo_c) / (2 * incremento);

end

