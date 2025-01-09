fileID = fopen('data.txt', 'r');
data = textscan(fileID, '%d %f %s', 'Delimiter', ',');
fclose(fileID);
disp(data);