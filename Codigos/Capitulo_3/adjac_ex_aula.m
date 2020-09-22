%script exemplo (Cria matriz adjacêncas)
n=2;
rotate3d;
[x,y] = meshgrid(-1:2/n:1,-1:2/n:1);
z =  exp(-(x.^2 + y.^2+eps));
T = delaunay(x,y);
trimesh(T,x,y,z);

nt = 2*(n*n);           % qt de triângulos
nv = (n+1)*(n+1);       % qt de vértices
Ad=zeros(nv,nv);        % Matriz de adjacências
for k=1:nv              % adj do vertice k
  for i=1:nt            % percorrendo cada triângulo
     v(1)=T(i,1);
     v(2)=T(i,2);
     v(3)=T(i,3);     % 3 vertices do triângulo
     if ((v(1)==k)||(v(2)==k)||(v(3)==k))
       for j=1:3
         if (v(j)~=k)
           Ad(k,v(j))=1;   % Seta 1 na coluna j
         endif
       endfor
     endif  
  endfor
endfor  

% visualizando T e AD
T 
Ad 
