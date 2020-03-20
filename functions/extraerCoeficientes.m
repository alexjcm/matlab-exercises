function array_coef = extraerCoeficientes(grado)
% Extrae los coeficientes de un polinomio al ingresarlo

array_coeficientes = [];
for i = 0 : grado
    coef = input(['Ingrese coeficiente de x^' int2str(grado - i) ': ' ]);
    array_coeficientes = [array_coeficientes coef];
end

array_coef = array_coeficientes;

end

