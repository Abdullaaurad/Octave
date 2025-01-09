x = 0:0.1:2*pi; % Generate data
y = sin(x);     % Compute sine

plot(x, y);     % Plot the sine curve
title('Sine Wave');
xlabel('x-axis');
ylabel('y-axis');
grid on;

print -dpng 'sine_wave.png'; % Save as PNG
