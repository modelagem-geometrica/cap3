%X = [0 2 4 6];
%Y = [0 4 4 0];
t = linspace(0,2*pi,20);
X = cos(t);
Y = sin(t);
[BX BY] = Bezier_Curve(X,Y,50);
hold on
plot(X,Y,'r-o');
plot(BX,BY,'k-');
hold off