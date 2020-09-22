x = linspace(0,2*pi,30);
y1 = cos(x);
y2 = sin(x);
hold on
plot(x,y1,’r-s’);
plot(x,y2,’g-*’);
grid
xlabel(’eixo x’);
ylabel(’eixo y’);
title(’Grafico do seno e do cosseno’);
legend(’sen(x)’,’cos(x)’);
hold off
