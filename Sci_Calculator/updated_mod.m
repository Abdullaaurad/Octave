function updated_equation = updated_mod(equation)
    updated_equation = ''; % Initialize the updated equation
    i = 1; % Start index

    while i <= length(equation)
        if i + 2 <= length(equation) && strcmp(equation(i:i+2), 'mod') % Check for 'mod'
            % Find the start of the first operand
            j = i - 1;
            while j > 0 && (isstrprop(equation(j), 'digit') || equation(j) == ' ')
                j = j - 1;
            end
            j = j + 1;

            % Find the second operand
            k = i + 3; % Start after "mod"
            while k <= length(equation) && (isstrprop(equation(k), 'digit') || equation(k) == ' ')
                k = k + 1;
            end

            % Trim any spaces from operands
            operand1 = strtrim(equation(j:i-1)); % First operand
            operand2 = strtrim(equation(i+3:k-1)); % Second operand

            % Replace "a mod b" with "mod(a,b)"
            updated_equation = [updated_equation, equation(1:j-1), 'mod(', operand1, ',', operand2, ')'];

            % Update the equation to exclude the processed part
            equation = equation(k:end);
            i = 1; % Restart parsing from the beginning of the remaining equation
        else
            % Append the current character to the updated equation
            i = i + 1;
        end
    end

    % Append any remaining part of the equation
    updated_equation = [updated_equation, equation];
    disp(['Updated Equation: ', updated_equation]); % Display result
end
