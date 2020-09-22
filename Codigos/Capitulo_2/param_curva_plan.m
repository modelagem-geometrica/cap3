t = linspace(-2,2,80);
f = @(t) t.^2+1.0;
g = @(t) t.*cos(t);
plot(f(t), g(t))
grid
xlabel('f(t)')
ylabel('g(t)')
title('Exemplo de curva Parametrizada');
legend('Curva F(t)= < f(t), g(t) >');