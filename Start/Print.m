disp("Hi");
disp([1, 2, 3; 4, 5, 6]);

fprintf("Hi how are you");

x=5;
fprintf("X = %d", x)
fprintf("\n \nThis is in new line \n");

y=2.32;
fprintf("Y = %f", y);

% sprintf() Formats data into a string instead of printing it. Useful for creating formatted strings to use later.

str = sprintf('\nThe value of %s is %.3f', "pi", pi);
disp(str);

% warning('This is a warning message!');
% error('An error occurred!');

% Purpose: To display the commands being executed. Useful for debugging scripts.

echo on;  % Turns on echoing
x = 5;
y = x^2;
fprintf("\nlol\n");
echo off; % Turns off echoing