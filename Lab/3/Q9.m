x = linspace(7, 100, 7);
y = x .* 7;

z = x.^3;

plot3(x, y, z, 'o-', 'LineWidth', 2);
pause;