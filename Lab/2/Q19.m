X = [2, 3; 4, 1];
A = [3, 4, 10; 70, 1, 30];
Z = [2, 3; 50, 49; 0, 1];
Y = [1, 0, 0; 0, 1, 0; 0, 0, 1];

disp("Original matrix X:");
disp(X);
disp("Original matrix A:");
disp(A);
disp("Original matrix Z:");
disp(Z);
disp("Original matrix Y:");
disp(Y);

X_transpose = X';
A_transpose = A';
Z_transpose = Z';
Y_transpose = Y';

disp("Transposed matrix X:");
disp(X_transpose);
disp("Transposed matrix A:");
disp(A_transpose);
disp("Transposed matrix Z:");
disp(Z_transpose);
disp("Transposed matrix Y:");
disp(Y_transpose);

X_flip_lr = fliplr(X);
A_flip_lr = fliplr(A);
Z_flip_lr = fliplr(Z);
Y_flip_lr = fliplr(Y);

disp("Matrix X flipped left-right:");
disp(X_flip_lr);
disp("Matrix A flipped left-right:");
disp(A_flip_lr);
disp("Matrix Z flipped left-right:");
disp(Z_flip_lr);
disp("Matrix Y flipped left-right:");
disp(Y_flip_lr);

X_flip_ud = flipud(X);
A_flip_ud = flipud(A);
Z_flip_ud = flipud(Z);
Y_flip_ud = flipud(Y);

disp("Matrix X flipped up-down:");
disp(X_flip_ud);
disp("Matrix A flipped up-down:");
disp(A_flip_ud);
disp("Matrix Z flipped up-down:");
disp(Z_flip_ud);
disp("Matrix Y flipped up-down:");
disp(Y_flip_ud);
