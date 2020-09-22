px = py = linspace (-10, 10, 50)';
[x, y] = meshgrid (px, py);
r = sqrt (x.^2 + y.^2) + 0.1;
z = sin (r) ./ r;
surf (x, y, z);
xlabel('eixo x');
ylabel('eixo y');
zlabel ('F(x,y)')
title('Exemplo de Superficie');
legend('Superficie z=F(x,y)');
