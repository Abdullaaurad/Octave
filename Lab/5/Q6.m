
a = b = linspace(-8, 8, 41);

[xx, yy] = meshgrid(a, b);

c = sqrt(xx.^2 + yy.^2) + eps;

d = sin(c) ./ c;

mesh(a, b, d);

print('-dgif', 'SA_Abdulla_22000021.gif');