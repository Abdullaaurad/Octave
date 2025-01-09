data = [1, 2, 3; 4, 5, 6];
fileID = fopen('data.txt', 'w'); % Open file for writing
fprintf(fileID, '%d %d %d\n', data'); % Write each row of data
fclose(fileID); % Close the file
