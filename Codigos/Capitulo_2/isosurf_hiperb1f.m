[x, y, z] = meshgrid(-2:0.2:2, -2:0.2:2, -2:0.2:2);
G_1 = x.^2 + y.^2 - z.^2 -1.0;  % Hiperboloide
isosurface(x,y,z,G_1,0);
axis equal;
xlabel('eixo x');
ylabel('eixo y');
zlabel('eixo z');
legend('Hiperboloide uma folha');

