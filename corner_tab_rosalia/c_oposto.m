function [ind,v1,v2] =c_oposto(k,C,q)
% Encontra o corner oposto
% Parametros:
%           k: posicao do corner
%           q: residuo de k/3 tal que k = 3*(t-1)+q ----- q=3 - k do programa
%           principal
% Da como resultado:
%           ind: fase onde v1 e v2 coincidem como vertices
%           v1, v2: Vertices que acompanha ao corner k
            

t=C(k,3); % triangulo onde pertence o corner k
v1=0;
v2=0;
if q==0
    v1=C(k-2,2);
    v2=C(k-1,2);
elseif q==2
    v1=C(k-1,2);
    v2=C(k+1,2);
elseif q==1
    v1 = C(k+1,2);
    v2 = C(k+2,2);
end
i=0;
ind = 0;  % Identifica a fase onde v1 e v2 coincidem como vertices
while (ind == 0 && i<=t-2)
    P = find(C(3*i+1:3*(i+1),2) == v1,1);
    Q = find(C(3*i+1:3*(i+1),2) == v2,1);
    if (isempty(P)==0 && isempty(Q)==0)
        ind = i+1;
        i=i+1;
    else
        i=i+1;
    end
end


