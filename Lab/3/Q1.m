A = [-11, 12, 2, 3, 45, 3, 42, 7, 89, 100, 105, 8, 98, 3, 7, 23, 21, 28, 7, 80, 87, 70, 9, 10, 7, 6];

M = mode_cal(A);
fprintf('Mode: %d\n', M);

Med = median(A);
fprintf('Median: %.2f\n', Med);

C = sort(A);
disp('Sorted array:');
disp(C);

D = mean(A);
fprintf('Mean: %.2f\n', D);

E = sum(A);
fprintf('Sum: %d\n', E);

F = max(A);
fprintf('Max: %d\n', F);

G = min(A);
fprintf('Min: %d\n', G);

