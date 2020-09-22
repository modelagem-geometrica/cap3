function [C, Vert, Face]=corner_table
% Cria a tabela corner - table 
% Usa as funcoes:
%               *  read_vtk.m : Lee um arquivo vtk e devolve os datos em
%                               forma de matriz.
%
fid=fopen('cuadroct.txt','w');
[Vert,Face,nvert,nface] = read_vtk('socket.vtk');
% Vert = matriz de vertices
% Faces = matriz de numeracao de triangulos
% nvert = numero de vertices
% nface =  numero de triangulos ou faces
C = zeros(3*nface,8);
C(:,1) = linspace(1,3*nface,3*nface); % ---enlistando corners

fprintf(fid,'Corner\t   Vert\t   Face\t        C.n\t       C.p\t        C.o\t       C.r\t     C.l \n');

% ---- PARA i=1
    C(1,2) = Face(1,2);  % ---- Em qual vertice se encontra o corner 3*i-2
    C(1,3) = 1;          % ---- Em qual triangulo se encontra o corner 3*i-2
    C(1,4) = 2;      % ---- C.n.: corner seguinte do corner 3*i-2
    C(1,5) = 3;        % ---- C.p.: corner anterior do corner 3*i-2
    %u = c_oposto(C(3*i-2,1),C,2);
    
 %   fprintf(fid,'%d\t %d\t %d\t %d\t %d\n',C(1,1), C(1,2),C(1,3),C(1,4),C(1,5));
    
    % ----- Para k=2 ou q=2
    C(2,2) = Face(1,3);  % ---- Em qual vertice se encontra o corner 3*i-1
    C(2,3) = 1;          % ---- Em qual triangulo se encontra o corner 3*i-1
    C(2,4) = 3;      % ---- C.n.: corner seguinte do corner 3*i-1
    C(2,5) = 1;        % ---- C.p.: corner anterior do corner 3*i-1
    
  %  fprintf(fid,'%d\t %d\t %d\t %d\t %d\n',C(2,1),C(2,2),C(2,3),C(2,4),C(2,5));
    
    % ----- Para k=3 ou q=0
    C(3,2) = Face(1,4);  % ---- Em qual vertice se encontra o corner 3*i
    C(3,3) = 1;          % ---- Em qual triangulo se encontra o corner 3*i
    C(3,4) = 1;      % ---- C.n.: corner seguinte do corner 3*i
    C(3,5) = 2;        % ---- C.p.: corner anterior do corner 3*i
    
   % fprintf(fid,'%d\t %d\t %d\t %d\t %d\n',C(3,1),C(3,2),C(3,3),C(3,4),C(3,5));

D=zeros(3*nface,1);
%for i = 2 : nface
for i = 2 : nface
    % ----- Para k=2 ----------ou q=1 em 3*(i-1)+q
    C(3*i-2,2) = Face(i,2);  % ---- Em qual vertice se encontra o corner 3*i-2
    C(3*i-2,3) = i;          % ---- Em qual triangulo se encontra o corner 3*i-2
    C(3*i-2,4) = 3*i-1;      % ---- C.n.: corner seguinte do corner 3*i-2
    C(3*i-2,5) = 3*i;        % ---- C.p.: corner anterior do corner 3*i-2
    
    
   % fprintf(fid,'%d\t %d\t %d\t %d\t %d\n',C(3*i-2,1), C(3*i-2,2),C(3*i-2,3),C(3*i-2,4),C(3*i-2,5));
    
    % ----- Para k=1----------- ou q=2 em 3*(i-1)+q
    C(3*i-1,2) = Face(i,3);  % ---- Em qual vertice se encontra o corner 3*i-1
    C(3*i-1,3) = i;          % ---- Em qual triangulo se encontra o corner 3*i-1
    C(3*i-1,4) = 3*i;      % ---- C.n.: corner seguinte do corner 3*i-1
    C(3*i-1,5) = 3*i-2;        % ---- C.p.: corner anterior do corner 3*i-1
        
   % fprintf(fid,'%d\t %d\t %d\t %d\t %d\n',C(3*i-1,1),C(3*i-1,2),C(3*i-1,3),C(3*i-1,4),C(3*i-1,5));
    
    % ----- Para k=3 -----------ou q=0 em 3*(i-1)+q
    C(3*i,2) = Face(i,4);  % ---- Em qual vertice se encontra o corner 3*i
    C(3*i,3) = i;          % ---- Em qual triangulo se encontra o corner 3*i
    C(3*i,4) = 3*i-2;      % ---- C.n.: corner seguinte do corner 3*i
    C(3*i,5) = 3*i-1;        % ---- C.p.: corner anterior do corner 3*i
       
   % fprintf(fid,'%d\t %d\t %d\t %d\t %d\n',C(3*i,1),C(3*i,2),C(3*i,3),C(3*i,4),C(3*i,5));
    
    [u,v1,v2] = c_oposto(C(3*i-2,1),C,1);
    if (u~=0)
        fer=find(C(3*(u-1)+1:3*u,2)~=v1);
        aux=find(C(3*(u-1)+fer,2)~=v2);
        C(3*(u-1)+fer(aux),2);
         D(3*i-2)=3*(u-1)+fer(aux);
         D(3*(u-1)+fer(aux)) = 3*i-2;
%         D(3*i-2)=u;
%         D(u) = 3*i-2;
    end
    [u,v1,v2] = c_oposto(C(3*i-1,1),C,2);
    if (u ~=0)
        fer=find(C(3*(u-1)+1:3*u,2)~=v1);
        aux=find(C(3*(u-1)+fer,2)~=v2);
        C(3*(u-1)+fer(aux),2);
        D(3*(u-1)+fer(aux)) = 3*i-1;
        D(3*i-1)=3*(u-1)+fer(aux);
    end
    [u,v1,v2] = c_oposto(C(3*i,1),C,0);
    if (u~=0)
        fer=find(C(3*(u-1)+1:3*u,2)~=v1);
        aux=find(C(3*(u-1)+fer,2)~=v2);
        C(3*(u-1)+fer(aux),2);
        D(3*i)=3*(u-1)+fer(aux);
        D(3*(u-1)+fer(aux)) = 3*i;
    end

end
C(:,6)=D;

% -- %%%%%%  CORNER DIREITA  E ESQUERDA %%%%%%%%%
for i=1:nface
    % PARA k=3i-2
    k=3*i-2;
    temp = C(k,4);
    C(k,7)= C(temp,6); %%%%% CORNER DIREITA
    temp2 = C(k,5);
    C(k,8)= C(temp2,6); %%%%% CORNER ESQUERDA
 fprintf(fid,'%d\t  %d\t   %d\t   %d\t   %d\t   %d\t  %d\t  %d\t\n',C(k,1),C(k,2),C(k,3),C(k,4),C(k,5),C(k,6),C(k,7),C(k,8));
    % PARA k=3i-1
    k=3*i-1;
    temp2 = C(k,5);
    C(k,8)= C(temp2,6); %%%%% CORNER ESQUERDA
    C(k,7)= C(k-1,8); %%%%% CORNER DIREITA
 fprintf(fid,'%d\t  %d\t   %d\t   %d\t   %d\t   %d\t  %d\t  %d\t\n',C(k,1),C(k,2),C(k,3),C(k,4),C(k,5),C(k,6),C(k,7),C(k,8));
    % PARA k=3i
    k=3*i;
    C(k,7)= C(k-1,8); %%%%% CORNER DIREITA
    C(k,8)= C(k-2,7); %%%%% CORNER ESQUERDA  
  
 fprintf(fid,'%d\t  %d\t   %d\t   %d\t   %d\t   %d\t  %d\t  %d\t\n',C(k,1),C(k,2),C(k,3),C(k,4),C(k,5),C(k,6),C(k,7),C(k,8));
end


fclose('all');

