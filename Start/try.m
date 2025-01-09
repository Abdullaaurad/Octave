try
    a = 10;
    b = 0;
    result = a / b; % This will throw an error
catch
    disp('An error occurred!');
    result = NaN; % Handle error gracefully
end
disp(result); % Display result (NaN in this case)
