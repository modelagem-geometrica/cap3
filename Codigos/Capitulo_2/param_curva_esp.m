t = linspace(0,20,100);
plot3(sin(t),cos(t),t)
xlabel('sin(t)')
ylabel('cos(t)')
zlabel('t')
axis square
xlabel('eixo x');
ylabel('eixo y');
zlabel ('eixo z')
title('Exemplo de curva Parametrizada');
legend('Curva F(t)=< sin(t), cos(t), t>, t=[0,20]');
