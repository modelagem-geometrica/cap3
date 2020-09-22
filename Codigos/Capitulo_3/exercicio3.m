%script exercicio3 (Gaussiana)

n=2;
rotate3d;
[x,y] = meshgrid(-1:2/n:1,-1:2/n:1); %gerando a malha bidim.
z =  exp(-(x.^2 + y.^2+eps));        %função gaussiana
T = delaunay(x,y)                    %gerando a triangulação
trimesh(T,x,y,z);                    %plotando