function sinus(odkud)
x = -odkud:.05:odkud;
[X,Y]=meshgrid(x);
Z = 1./(1+sqrt(X.^2+Y.^2)) .* sin(sqrt(X.^2+Y.^2));
contour3(X,Y,Z,30)
end