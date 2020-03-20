function resultado = derivadaCentrada3PuntosV2(incremento, x)
% formula --->   f'(X0) = (f(X0 - 2h)  - 8*f(X0 - h) + 8*f(x0 + h) - f(x0 + 2h) / 12h

campo01 = feval('evaluarPolinomioComplejo', (x - (2*incremento)));  
campo02 = 8 * feval('evaluarPolinomioComplejo', (x - incremento));  
campo03 = 8 * feval('evaluarPolinomioComplejo', (x + incremento));  
campo04 = feval('evaluarPolinomioComplejo', (x + (2*incremento))); 

resultado = (campo01 - campo02 + campo03 - campo04) / (12 * incremento);

end

