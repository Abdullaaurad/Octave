row_vector = [1,2;3,4];
col_vector = [1;2;3;4];

fprintf("Vector 1 \n");
disp(row_vector);
fprintf("Vector 2 \n");
disp(col_vector);

A = [1, 2; 3, 4];
B = [5, 6; 7, 8];
C = A + B; % Addition
D = A * B; % Multiplication
E = A / B;

Z = A^2;
fprintf("Square = \n");
disp(Z);

fprintf("Vector 3 \n");
disp(C);

fprintf("Vector 4 \n");
disp(D);

fprintf("Vector 5 \n");
disp(E);

F = A';
fprintf("trasnpose 6 \n");
disp(F);

G = flipud(A);
H = fliplr(A);

fprintf("Vector 7 \n");
disp(G);

fprintf("Vector 8 \n");
disp(H);

I = transpose(A);
fprintf("Vector 9 \n");
disp(I);

L = pinv(A)  %inverse of a matrix
disp(L);

K = eye(5,5); %identity matrix;
fprintf("Indentity matrix \n");
disp(K);

L = det(A);
fprintf("Determinant \n");
disp(L);

M = rot90(K,1);
fprintf("Rotated \n");
disp(M);

A = [2, 3, 1, 4];  % Original array
N = reshape(A, 2, 2);  % Reshape into a 2x2 matrix

fprintf("Reshaped:\n");
disp(N);
