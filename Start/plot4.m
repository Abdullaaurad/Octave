x = 0:0.1:pi*2;
y1 = sin(x);
y2 = cos(x);
plot(x, y1, 'LineWidth', 2, 'Marker', 'o', x, y2,'Marker', 'x');
legend('sin(x)', 'cos(x)');
pause;