x = 0:0.1:pi*2;
y1 = sin(x);
y2 = cos(x);
plot(x, y1, '-r', x, y2, '--b'); % Red solid for sin, blue dashed for cos
legend('sin(x)', 'cos(x)');
pause;