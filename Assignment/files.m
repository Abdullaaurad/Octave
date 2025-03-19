m = 'SA Abdulla';
k = 'I Love You';
n = 'Fadhiya';

save('text.txt' , 'm', 'k', 'n');
l = load('text.txt');
disp(l);

Var = [1,2,3,4,5]; 
csvwrite('lol.csv', Var)
a = csvread('lol.csv');
disp(a);

% Open file for writing in binary mode
fid = fopen('f.txt', 'w');   % 'w' = write mode
Var = 'Hello, Octave!';       % Example variable to write

fwrite(fid, Var);  % Write data to file
fclose(fid);       % Close file

% Open file for reading in binary mode
fid = fopen('f.txt', 'r');   % 'r' = read mode
b = fread(fid, '*char')';    % Read as characters and transpose to get proper string
fclose(fid);                 % Close file

disp(b);  % Display the content

x = -5:0.5:5;  % Define x-coordinates
y = -5:0.5:5;  % Define y-coordinates
[X, Y] = meshgrid(x, y);  % Generate the grid
Z = sin(sqrt(X.^2 + Y.^2));  % Define a function
surf(X, Y, Z);  % Create a surface plot
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('3D Surface Plot');
pause;