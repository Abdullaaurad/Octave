disp(cos(0));
disp(2^1/2);
disp(2^(1/2));  %Root(2)

%!Octave Folows BODMAS principal right

l = 3*j + 9*i + 3*j + 7 + 8*i;
disp(l);

%12+3+8 = 23
m = 3*i * 5*j;
disp(m);

k = -6j/3i;
disp(k);

n = -8/64j;
disp(n);

w = [5,6,7;8,10,62;23,4,7]       %Is a Array of 3X3

a = [9,3,4; 5,8,7]
b = [7,4,3; 8,7,2]

disp(a+b);

disp(a.*b);      %for the bitwise multiplication we must use the . before * 
disp(a./b);      %for the bitwise division we must use the . before /

o = 5;
printf("Hi %d %f \n", o,(2^(1/2)));
printf('lol \n')

z = 1 + 3j;
printf("z = %.2f + %.2fi\n", real(z), imag(z));

disp(log(2));                %log(x) it uses base 𝑒≈2.718.
disp(log10(2));              %log 10(x) uses base 10 as defined.

disp(iskeyword("if"));   % Correct syntax

disp(who('n'));
disp(whos('n'));

disp(Inf + Inf)
disp(Inf - Inf)
disp(Inf * Inf)
disp(Inf / Inf)
disp((i * Inf)^2);
disp(inf/i);

%The clc command is used to clear the screen.
%The clear command is used to clear variables and values.

disp(sqrt(25));

a = [9,3,4; 5,8,7]       %Matrix 
disp(a');                %transpose

disp('');               
disp(fliplr(a));         %left right fliped

disp('');
disp(flipud(a));         %up down shift

disp(linspace(0,10,5));
disp(logspace(0,10,5));

a = rand(2,3);
disp('');
disp(a);

b = pinv(a);
disp('');
disp(b);

disp("detarminent =");
disp(det(w));                %to find det the matrix must be a square matrix 

d=eye(3,2);
disp(d);
disp('');

e = [1,2,3;4,5,6;7,8,9];
disp(e);
disp('');
disp(rot90(e, 1));
disp('');
disp(rot90(e, 2));
disp('');
disp(rot90(e, 3));

a = [2,3; 1,4; 5,6]
disp(reshape(a, 1, 6));   %Whn reshaping the count of element must be same for each matrix

b=rand(2,3)
disp(sort(b));

% max(9,77,100);
disp(max([9,77,100]));

A = ones(3, 3);           %3x3 matrix of ones
disp(tril(A));
disp(triu(A));

% y=[23,12]
% z=[42,10]
% subplot(2,2,1);  % First subplot (2x2 grid, position 1)
% plot(y, z);       % Plot the first graph

% subplot(2,2,2);  % Second subplot (2x2 grid, position 2)
% plot(z, y); 

% subplot(2,2,3);  % Second subplot (2x2 grid, position 3)
% plot(z, y);

% subplot(2,2,4);  % Second subplot (2x2 grid, position 4)
% plot(z, y); 

% clear

% x= linspace (7, 98,7);
% plot3(x, 4*x, x.^2)

% Create some data
x = 0:0.1:10;
y = sin(x);
z = cos(x);

% 2D plot
% plot(x, y, 'r');  % Plot y vs. x in red
% hold on;
% plot(x, z, 'b');  % Plot z vs. x in blue

% Add text
%text(0, 0, 'Intersection', 'FontSize', 12);

% Turn on grid
grid on;

% Zoom in
%axis([0 10 -1.5 1.5]);  % Manually zoom in by setting axis limits

% Toggle axes visibility
%axis off;  % Hide axes
xlabel('X-axis Label');   % Label for x-axis
ylabel('Y-axis Label');   % Label for y-axis

% Toggle interactive zoom
zoom on;

% Rotate (for 3D plots only)
% plot3(x, y, z);   % Uncomment for 3D plot
% view(45, 30);      % Set 3D view (if using 3D plotting)

hist(randn (1,100), 28, "facecolor", "y", "edgecolor", "g");

printf('The value of pi is approximately: %.2f\n', pi);
result = sprintf('lol');
disp(result);  % Displays 'lol' stored in the variable
fprintf('lol');  % Prints 'lol' to the console

disp(mat2str(56));
% disp(mat2str('56'));            %won't work


pause

A = randi([1, 80], 10, 7);  % 10 rows, 7 columns, integers between 1 and 80
disp(A);