%script trimesh_versa2

% As coordenadas e os vertices
% 1.0 0.0 0.0
% 0.0 1.0 0.0
% 0.0 0.0 1.0
% 0.0 0.0 0.0 
% 2  3  4
% 4  1  2
% 3  2  1
% 1  4  3
%serão lidos do arquivo dados.OBJ


%Lendo dados
load  dados.OBJ

A = dados;

% qt de vertices
n = length(A)/2;

X = A(1:n,1);
Y = A(1:n,2);
Z = A(1:n,3);
trigs = A(n+1:2*n,:);

%plotando
rotate3d;  % permite usar o mouse para rotacionar
subplot(121); 
I=trimesh(trigs,X,Y,Z);
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