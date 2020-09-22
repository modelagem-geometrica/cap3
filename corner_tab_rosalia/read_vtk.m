function [vertex,face,nvert,nface] = read_vtk(filename)

% Lee arquivo vtk e retorna como matriz vertex (os vertices) e face (a matriz das faces)

fid = fopen(filename,'r');
% if( fid==-1 )
%     error('Can''t open the file.');
%     return;
% end

str = fgets(fid);   % -1 if eof
% if ~strcmp(str(3:5), 'vtk')
%     error('The file is not a valid VTK one.');    
% end

%%% read header %%%
str = fgets(fid);
str = fgets(fid);
str = fgets(fid);
str = fgets(fid);
nvert = sscanf(str,'%*s %d %*s', 1);
%nvert;

% read vertices
[A,cnt] = fscanf(fid,'%f %f %f', 3*nvert);
if cnt~=3*nvert
    warning('Problem in reading vertices.');
end
A = reshape(A, 3, cnt/3); % reorganiza o tamanho da matriz A como 3 x (cnt/3)
vertex = A';  % Podria colocar A'
%%%%%%%%%%% REVISADO BIEN %%%%%%%%%%%%%

% read faces
str = fgets(fid);
str = fgets(fid);

info= sscanf(str,'%*s %d %d', 1);
    nface = sscanf(str,'%*s %d %*s', 1);

    [A,cnt] = fscanf(fid,'%d %d %d %d\n', 4*nface);
    if cnt~=4*nface
        warning('Problem in reading faces.');
    end

    A = reshape(A, 4, cnt/4);
    face = A';
fclose(fid);
return