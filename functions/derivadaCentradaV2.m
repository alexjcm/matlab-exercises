function resultado = derivadaCentradaV2(incremento, x)
% DERIVADACENTRADA Summary of this function goes here
% formula --->   f'(X0) = (f(X0 + h)  - f(X0 - h)) / 2h  

campo01 = feval('evaluarPolinomioComplejo', (x + incremento));
campo02 = feval('evaluarPolinomioComplejo', (x - incremento));

resultado = (campo01 - campo02) / (2 * incremento);

end

