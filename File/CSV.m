data = csvread('data.csv'); % Read data from a CSV file
disp(data);
csvwrite('data.csv', data); % Write data to CSV