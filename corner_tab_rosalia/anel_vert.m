function [Anel, Triang]=anel_vert(v)
% Este programa volta o anel de v
% Usa a função corner_table.m
%
[C, Vert, Face] = corner_table;
b = find(C(:,2) == v); % Procura na coluna dos vertices.

Anel=zeros(2*length(b),1);
Triang=zeros(length(b),1);

for i=1:length(b)
    corn = C(b(i),5); % corner preview
    Anel(i)=C(corn,2); 
    corn = C(b(i),4); % corner next
    Anel(i+length(b))=C(corn,2);
    % Localiza triangulo onde v pertence
    Triang(i)=C(b(i),3);
end
% ELIMINAR REPETIDOS %%%%
k=1;
 n=length(Anel);
 while k<=n
     j=1;
     while j<=n
         if k~=j
             if Anel(k)==Anel(j)
                 Anel(j)=[];
                 n=length(Anel);
                 j=j-1;
             end
         end
         j=j+1;
     end
     k=k+1;
 end
 
 Anel = sort(Anel);
 Triang= sort(Triang);

 
 
 
