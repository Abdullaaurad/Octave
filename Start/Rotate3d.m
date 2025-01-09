x = 0:0.1:10;
y = sin(x);
z = cos(x);
plot3(x, y, z);  % Create a 3D plot
title('3D Plot - Rotate Enabled');
rotate3d on;     % Enable rotation mode
pause;