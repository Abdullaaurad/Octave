data = randn(1, 100);

bar(hist(data, 28), 'facecolor', 'y', 'edgecolor', 'r');

xlabel('Bins');
ylabel('Frequency');
title('Histogram with Custom Colors');

pause;
