function updated_equation = updated_fac(equation)
    disp(equation);
    % Initialize variables
    updated_equation = '';
    i = 1;

    % Iterate through the equation
    while i <= length(equation)
        % Debugging: Display current state of the updated equation
        disp(['Processing index ', num2str(i), ': ', updated_equation]);

        if equation(i) == '!' && equation(i-1) == ')'
            j = i - 1;
            open_count = 0;
            while j > 0
                if equation(j) == ')'
                    open_count = open_count + 1;
                elseif equation(j) == '('
                    open_count = open_count - 1;
                    if open_count == 0
                        break;
                    end
                end
                j = j - 1;
            end

            if j > 0
                % Insert 'factorial(' at the matching '(' and ')' at the end
                updated_equation = [equation(1:j-1), 'factorial', equation(j:i-1), equation(i+1:end)];
            else
                error('Mismatched parentheses around "!"');
            end

        elseif equation(i) == '!' && isstrprop(equation(i-1), 'digit')
            % Find the start of the number preceding '!'
            j = i - 1;
            while j > 0 && isstrprop(equation(j), 'digit')
                j = j - 1;
            end
            j = j + 1;
        
            % Build the updated equation
            updated_equation = [equation(1:j-1), 'factorial(', equation(j:i-1), ')'];
        
            % Append the remaining part of the equation
            if i < length(equation)
                updated_equation = [updated_equation, equation(i+1:end)];
            end
        
            equation = updated_equation;
            i = 0;
        end
        i = i + 1;        
    end
    updated_equation = equation;
    disp(['Final equation: ', updated_equation]);
end
