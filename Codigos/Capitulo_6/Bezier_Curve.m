function [BX BY] = Bezier_Curve(X,Y,N)
    n = size(X,2)-1;
    for i = 0:N
        t = i/N;
        [BX(i+1) BY(i+1)] = Bezier(n,X,Y,t);
    end
    return
end

function [PX PY] = Bezier(n,X,Y,t)
   PX = 0;
   PY = 0;
   for i = 0:n
       B = Bezier_Nucleo(i,n,t);
       PX = PX + X(i+1)*B;
       PY = PY + Y(i+1)*B;
   end
end

function [B] = Bezier_Nucleo(i,n,t)
    C = 1;
    for j = 1:i
        C = C*(n-j+1)/j;
    end
    B = C*t^i*(1-t)^(n-i);
    return
end