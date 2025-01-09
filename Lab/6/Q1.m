x = linspace(-10, 10, 50);
y = linspace(-10, 10, 50);
[xx, yy] = meshgrid(x, y);
figure;
mesh(xx, yy, 2 - (xx.^2 + yy.^2));
saveas(gcf, '22000021.png');
pause;
