w = ones (11, 11);

u = zeros(11, 11);

fprintf ("Array W \n");
disp(w);

disp("Array U");
disp(u);

A = tril(w);
disp("The lower triangual metrix of w");
disp(A);

v = triu(w);
disp("The upper triangual metrix of w");
disp(v);

disp("u-v");
disp(u-v);

y = u-v;
z = sqrt(y);

disp("Square root of y");
disp(z);