 nrows = 10; % Alocando a matriz
 ncols = 10;
 myData = ones(nrows, ncols)
% Preencher a matriz
for r = 1:nrows
  for c = 1:ncols
     if r == c
        myData(r,c) = 2;
     elseif abs(r - c) == 1
        myData(r,c) = -1;
     else
       myData(r,c) = 0;
     end
  end
end
myData