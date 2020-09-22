t = linspace(0,10,40);
u = linspace(-2,2,40);
[t,u] = meshgrid(t,u);
x = 2.*t;
y = 3*u.*cos(t);
z = u.*sin(t);
surf(x,y,z)
xlabel('eixo x');
ylabel('eixo y');
zlabel ('eixo z')
title('Exemplo de Superficie Parametrizada');
legend('Superficie F(t,u)');
