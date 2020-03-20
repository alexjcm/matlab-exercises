function resultado = derivadaProgresivaV2(incremento, x)
% DERIVADAPROGRESIVA Summary of this function goes here
% formula --->   f'(X0) = (f(X0 + h)  - f(X0)) / h

campo01 = feval('evaluarPolinomioComplejo', (x + incremento));
campo02 = feval('evaluarPolinomioComplejo', x);

resultado = (campo01 - campo02) / incremento;

end

