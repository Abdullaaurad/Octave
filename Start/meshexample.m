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