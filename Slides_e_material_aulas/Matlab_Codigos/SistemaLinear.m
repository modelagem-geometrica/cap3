clear
clc
A=[1 -2 3; 4 5 7; -1 8 9];
%A=[1 -2 3; 4 5 7; -1 8 9; -2 3 -1; -2 3 -11];
b=[2;4;8];
%b=[2;4;8;3;-1];
format rat
%x=A^-1*b;
%x=A\b;
x=linsolve(A,b);
disp('A solução do sistema eh :');
disp(x);