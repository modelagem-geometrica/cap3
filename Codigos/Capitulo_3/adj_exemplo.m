%  v1       v4
%   ---------
%   | T1  / | \
%   |   /   |   \
%   | /  T2 | T3  \
%   ---------------
%  v2       V3      v5

T=[ 4 2 1; 4 3 2; 5 3 4]
nt=3;
nv=5;

Ad=zeros(nv,nv);        % Matriz de adjacências
for k=1:nv              % adj do vertice k
  for i=1:nt            % percorrendo cada triângulo
     v(1)=T(i,1);
     v(2)=T(i,2);
     v(3)=T(i,3);           % 3 vertices do triângulo
     if ((v(1)==k)||(v(2)==k)||(v(3)==k))
       for j=1:3
         if (v(j)~=k)
           Ad(k,v(j))=1; % Seta 1 na coluna v(j) na linha k
         endif
       endfor
     endif  
  endfor
endfor  

% visualizando T e AD
T 
Ad 