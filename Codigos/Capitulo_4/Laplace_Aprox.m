function [X] = Laplace_Aprox(N, t, x, K, I, periodica, funcx, funcy)
    % Ponto inical - Equacao de Laplace
    if periodica == 0
        a(1,1) = funcx(t(1));
        a(1,2) = funcy(t(1));
        A(1,1) = 1.0;
    else
        a(1,1) =  0.0;
        a(1,2) =  0.0;
        A(1,1) = -2.0;
        A(1,N) =  1.0;
        A(1,2) =  1.0;
    end  
    % Pontos do meio da curva - Equacao de Laplace
    for i = 2:N-1
        a(i,1)   =  0.0;
        a(i,2)   =  0.0;
        A(i,i)   = -2.0;
        A(i,i-1) =  1.0;
        A(i,i+1) =  1.0;
    end
    % Ponto final - Equacao de Laplace
    if periodica == 0
        a(N,1)   = funcx(t(N));
        a(N,2)   = funcy(t(N));
        A(N,N)   = 1.0;
    else
        a(N,1)   =  0.0;
        a(N,2)   =  0.0;
        A(N,N)   = -2.0;
        A(N,N-1) =  1.0;
        A(N,1)   =  1.0;
    end 
    % Restricoes - Condicoes de contorno de Diriclet
    for i = 1:K
        A(N+i,I(i)) =  1.0;
        a(N+i,1)    =  funcx(t(I(i)));
        a(N+i,2)    =  funcy(t(I(i)));
    end
    % Solucao do sistema pelo metodo dos minimos quadrados
    X = pinv(A)*a;
    return
end