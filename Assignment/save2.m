% x = linspace(1,100,20)
% y = randn(1,20)

% plot(x,y)
% saveas(gcf, "Plot.jpg")
% pause

k = csvread('lol.csv')
m = [1,2,3,4,5,6,7,8,9]

csvwrite('lol.csv', m)
k = csvread('lol.csv')
disp(k)