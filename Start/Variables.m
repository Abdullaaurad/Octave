x = 10; % Integer
y = 3.14; % Float
z = 'Hello'; % String

disp(x);
disp(y);
disp(z);

l = num2str(x);
disp(l);

% l =num2str(l) + z; can't do this
l = [l," ", z];
%only one data type variables are allowed to concatentate in this format

disp(l);