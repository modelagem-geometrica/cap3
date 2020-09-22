[X,Y,Z] = peaks(40);
subplot(221)
surf(X,Y,Z);
subplot(222)
surf(X,Y,Z);
shading interp    % interpolate the colormap across the surface face
subplot(223)
surf(X,Y,Z);
light             % create a light
lighting gouraud  % preferred method for lighting curved surfaces
subplot(224)
surf(X,Y,Z);
material dull    % set material to be dull, no specular highlights