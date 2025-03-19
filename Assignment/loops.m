for i = 1:10:20
    disp(i)
end

disp("While loop");
x=1;
while(x<10)
    disp(x);
    x=x+1;
end

disp("Do while loop");
do
    disp(x);
    x=x-1;
until(x>1)

disp("If else loop");
if(1<2)
    disp("True");
else
    disp("False");
end

disp("Switch case loop");

switch(1)
    case 1
        disp("Case 1");
        return;
    case 2
        disp("Case 2");
        return;
    otherwise
        disp("Default");
        return;
end