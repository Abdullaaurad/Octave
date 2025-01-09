clear;
n = 1000;
x = linspace(-10, 10, n);
y = cos(x);
s = sign(y);
plot(x, s .* y);

saveas(gcf, 'S.A.Abdulla_22000021_4.png');
