
x = input("Enter a integer number =");
fprintf("Inputed number is = %d\n",x);

name = input('What is your name? ', 's');
disp(['Hello, ', name, '!']);

%only works in Octave GUI
choice = menu('Choose a fruit:', 'Apple', 'Banana', 'Cherry');
if choice == 1
    disp('You chose Apple.');
elseif choice == 2
    disp('You chose Banana.');
else
    disp('You chose Cherry.');
end

