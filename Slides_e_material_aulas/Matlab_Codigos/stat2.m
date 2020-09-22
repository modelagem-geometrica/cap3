function [m,s] = stat2(x)
n = length(x);
m = media(x,n);
s = sqrt(sum((x-m).^2/n));
end
