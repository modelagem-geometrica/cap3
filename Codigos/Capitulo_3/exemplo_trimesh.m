%script trimesh_versao1

% As coordenadas
% 1.0 0.0 0.0
% 0.0 1.0 0.0
% 0.0 0.0 1.0
% 0.0 0.0 0.0 
%serão lidas do arquivo coordenadas.dat

% Os vértices
% 2  3  4
% 4  1  2
% 3  2  1
% 1  4  3
%serão lidos do arquivo vertices.dat

%Lendo dados
load  coordenadas.dat
load  vertices.dat

X = coordenadas(:,1);
Y = coordenadas(:,2);
Z = coordenadas(:,3);
trigs = vertices;

%plotando
rotate3d;  % permite usar o mouse para rotacionar
subplot(121); 
trimesh(trigs,X,Y,Z);
xlabel('eixo x');
ylabel('eixo y');
zlabel('eixo z');
title('Exemplo Trimesh');
axis equal;
subplot(122)
trisurf(trigs,X,Y,Z);
xlabel('eixo x');
ylabel('eixo y');
zlabel('eixo z');
title('Exemplo Trisurf');
axis equal;
