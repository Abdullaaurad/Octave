% Define the range for x and y
x = linspace(-5, 5, 100); % Generate 100 points between -5 and 5
y = linspace(-5, 5, 100);

% Create a meshgrid for x and y
[X, Y] = meshgrid(x, y);

% Define the saddle surface (hyperbolic paraboloid)
Z = X.^2 - Y.^2;

% Plot the surface
figure;
surf(X, Y, Z);

% Add labels and title
xlabel('x');
ylabel('y');
zlabel('z');
title('3D Hyperbolic Paraboloid (Saddle Surface)');

% Add shading and color
shading interp; % Smoothens the surface
colormap jet; % Color scheme
colorbar; % Add a color bar

% Optional: Add grid and adjust view angle
grid on;
view(-30, 45); % Set view angle

pause;