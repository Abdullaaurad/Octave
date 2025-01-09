x1 = [1, 2, 3, 4, 5, 6, 7];
y1 = [1, 4, 9, 16, 25, 36, 49];

x2 = linspace(1, 7, 98);
y2 = x2.^2;

plot(x1, y1, 'ro-', 'LineWidth', 2, 'DisplayName', 'sc01 (Discrete)');

hold on;

plot(x2, y2, 'b-', 'LineWidth', 1.5, 'DisplayName', 'sc02 (Smooth)');

xlabel('x-axis');
ylabel('y-axis');
title('Comparison of sc01 and sc02');

legend;

grid on;

hold off;
pause;