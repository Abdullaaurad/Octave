% X = linspace (-90, 180, 280);
% Y = sin(X);
% plot(X,Y);
% pause;

% Program 'a'
X = linspace(-90, 180, 280);
Y = sin(X);
plot(X, Y);
title('Program a');
% Save as images
saveas(gcf, 'S.A.Abdulla_22000021_a.jpg');
saveas(gcf, 'S.A.Abdulla_22000021_a.jpeg');
saveas(gcf, 'S.A.Abdulla_22000021_a.bmp');
saveas(gcf, 'S.A.Abdulla_22000021_a.gif');
saveas(gcf, 'S.A.Abdulla_22000021_a.png');

% Program 'b'
X = linspace(-90, 180, 280);
Y = sind(X);
plot(X, Y);
title('Program b');
% Save as images
saveas(gcf, 'S.A.Abdulla_22000021_b.jpg');
saveas(gcf, 'S.A.Abdulla_22000021_b.jpeg');
saveas(gcf, 'S.A.Abdulla_22000021_b.bmp');
saveas(gcf, 'S.A.Abdulla_22000021_b.gif');
saveas(gcf, 'S.A.Abdulla_22000021_b.png');