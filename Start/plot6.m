x = 0:0.1:pi*2;
subplot(2, 2, 1); % 2 rows, 2 column, first plot
plot(x, sin(x));
title('Sine');

subplot(2, 2, 2); % Second plot
plot(x, cos(x));
title('Cosine');

subplot(2, 2, 3); % Second plot
plot(x, cos(x));
title('Cosine-2');

pause;