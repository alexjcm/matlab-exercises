function resultado = derivadaRegresiva3PuntosV2(incremento, x)
% DERIVADAPROGRESIVA3PUNTOS Summary of this function goes here
% formula --->   f'(X0) = (f(X0 - 2h)  - 4*f(X0 - h) + 3*f(x0)) / 2h

campo01 = feval('evaluarPolinomioComplejo', (x - (2 * incremento)));
campo02 = 4 * feval('evaluarPolinomioComplejo', (x - incremento));
campo03 = 3 * feval('evaluarPolinomioComplejo', x);

resultado = (campo01 - campo02 + campo03) / (2 * incremento);

end
