%[X,Y] =meshgrid(-2:0.1:2,-2:0.1:2); 
%Z = exp(Y.^2).+3*X;
[X,Y] =meshgrid(-8:0.5:8,-8:0.5:8);
r =sqrt(X.^2+Y.^2)+eps;
Z = sin(r)./r;
subplot(221)
mesh(X,Y,Z);
colorbar
subplot(222)
surf(X,Y,Z);
subplot(223)
%hold on
%mesh(X,Y,Z);
meshc(X,Y,Z)
%hold off
subplot(224);
contour(X,Y,Z);
%contour(X,Y,Z,30);