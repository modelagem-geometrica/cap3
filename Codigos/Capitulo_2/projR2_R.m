px = py = linspace (-3, 3, 50)';
[x, y] = meshgrid (px, py);
z = 3.5.^(-1.*sqrt(x.^2+y.^2)).*cos(y).*sin(0.5*x);
contour(x,y,z,10)
xlabel('eixo x');
ylabel('eixo y');
legend('Plano xy');