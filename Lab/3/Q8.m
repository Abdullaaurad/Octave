x1 = linspace(-49, 70, 210);
y1 = x1.^3;

x2 = linspace(7, 100, 7);
y2 = x2 .* 7;

z = x2.^3;

plot(x1, y1, 'r-', 'LineWidth', 1.5, 'DisplayName', 'y = x^3');
hold on;
plot(x2, y2, 'bo-', 'LineWidth', 1.5, 'MarkerSize', 8, 'DisplayName', 'y = x*7');
plot(x2, z, 'g--', 'LineWidth', 1.5, 'DisplayName', 'z = x^3');

xlabel('x-axis');
ylabel('y-axis');
title('Combined Plot of Three Datasets');

legend;

hold off;

pause;
