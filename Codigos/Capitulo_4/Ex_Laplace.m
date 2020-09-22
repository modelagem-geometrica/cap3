    % Numero de pontos
    N = 200;
    % Parametro
    a = 0.0;
    b = 2.0*pi;
    dt = (b-a)/N;
    for i = 1:N
        t(i) = a + (i-1)*dt;
    end

    % Parametrizacao
%     funcx     = @(t) 2*cos(2*t);
%     funcy     = @(t) sin(3*t);
   funcx     = @(t) 3*cos(3*t);
   funcy     = @(t) 5*sin(2*t);
   periodica = 1;
    % Valor exato
    x(:,1)   = funcx(t);
    x(:,2)   = funcy(t);
        
    % Divisão dos pontos dados nos parametros
    npontos = 20;
    n       = round(N/npontos);
    % Restricoes - Condicoes de contorno de Diriclet
    k  = 0;
    for i = 1:N
        if (mod(i,n) == 1)
            k       =  k+1;
            I(k)    =  i;
            xx(k,1) =  funcx(t(i));
            xx(k,2) =  funcy(t(i));
        end
    end
    K = k;
    
    % Calculo da aproximacao
    [X] = Laplace_Aprox(N,t,x,K,I,periodica,funcx,funcy);
    
    % Calculo do erro: soma dos erros em cada ponto
    ErroX = x - X;
    Erro  = sqrt(ErroX(:,1).^2 + ErroX(:,2).^2);
    erro  = sum(Erro)
    
    % Gerando grafico
    hold on
    plot(x(:,1),x(:,2),'r');
    plot(X(:,1),X(:,2),'b');
    plot(xx(:,1),xx(:,2),'g*');
    grid
    xlabel('eixo x'); 
    ylabel('eixo y');
    title('Aproximação'); 
    legend('Exato', 'Aproximado');
    hold off
    return