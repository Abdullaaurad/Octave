theta = linspace(0 ,2*pi, 100);
r = 1;
x = r * cos(theta);
y = r * sin(theta);
plot(x, y, 'b-', 'LineWidth', 2);
axis equal;
grid on;
xlabel('X-axis');
ylabel('Y-axis');
title("Perfect Circle");
saveas(gcf, "22000021.png");
pause;