%script media, desvio padrao
format short
valores = [1.7, 13.5, 100, -4.6, 5.1, 13.88, 33, 124.11];
[media,desvio_padrao] = stat2(valores);
disp('A media eh');
disp(media);
disp('O Desvio padrão eh');
disp(desvio_padrao);
