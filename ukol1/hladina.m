function hladina(odkud, vyska, tlumeni)
x = -odkud:.05:odkud;
% nasledne vytvorime sit, na ktere se bude pocitat vyska hladiny:
[X,Y]=meshgrid(x);
% Z = tlumici funkce * sinus vzdalenosti:
Z = 1./(vyska+(X.^2+Y.^2).^(tlumeni)) .* sin(sqrt(X.^2+Y.^2));
% nakreslime graf pomoci contour3:
contour3(X,Y,Z,30)
end