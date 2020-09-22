function rbf
    clear
    n = 128;
    t = linspace(0,2*pi,n+1);

    %% Circle
    %C = [cos(t); sin(t)]'; 
    %b = 1.5;

    %% Heart
    C =[16*(sin(t)).^3; 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)]'; 
    b = 17;

    %%
    C(end,:) = [];

    %% Solve linear system
    alpha = rbf_system(C);

    %% Eval RBF implicits
    N     = 201;
    u     = linspace(-b,b,N);
    [X Y] = meshgrid(u);
    Z     = zeros(N);
    for j = 1:N
        for i = 1:N
            p      = [X(i,j) Y(i,j)];
            Z(i,j) = rbf_evaluate(p,C,alpha) - 1;
        end
    end

    %% Draw all
    clf;
    hold on
    plot(C(:,1),C(:,2),'ro');
    v     = [-20 0 20];
    [c,f] = contour(X,Y,Z,v,'k');
    %clabel(c,f);
    %pcolor(X,Y,Z); shading('interp'); colorbar;
    axis square;
    axis tight;
    hold off
    
    return
end

function alpha = rbf_system(C)
    n = length(C);
    A = zeros(n);
    b = ones(n,1);
    for i = 1:n
        for j = i:n
            r = norm(C(i,:)-C(j,:));
            A(i,j) = rbf_func(r);
            if (i ~= j)
                A(j,i) = A(i,j);
            end
        end
    end
    alpha = A\b;
    return
end

function y = rbf_func(r)
    %r = distancia

    %y = exp(-r^2); 
    y = r^5;
    %y = r;
    return
end

function y = rbf_evaluate(x,C,alpha)
    n=length(alpha);
    y=0;
    for i = 1:n
        r = norm(x-C(i,:));
        y = y + alpha(i)*rbf_func(r);
    end
    return
end