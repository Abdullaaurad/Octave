function octal_str = dec2oct(decimal_num)
    % Initialize the result string
    octal_str = '';
    
    % Handle the case of 0 directly
    if decimal_num == 0
        octal_str = '0';
        return;
    end
    
    % While the decimal number is greater than 0, divide by 8 and collect remainders
    while decimal_num > 0
        remainder = mod(decimal_num, 8);  % Find the remainder when divided by 8
        octal_str = strcat(num2str(remainder), octal_str);  % Prepend the remainder to the result string
        decimal_num = floor(decimal_num / 8);  % Update the number by dividing it by 8
    end
end