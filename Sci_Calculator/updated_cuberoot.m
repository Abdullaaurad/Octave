function updated_equation = updated_cuberoot(equation)
    updated_equation = '';
    i = 1;
    
    while i <= length(equation)
        if double(equation(i)) == 226 && double(equation(i+1)) == 136 && double(equation(i+2)) == 155
            j = i + 3;
            
            if j <= length(equation) && equation(j) == '('
                k = j + 1;
                while k <= length(equation) && equation(k) ~= ')'
                    k = k + 1;
                end
                
                if k <= length(equation)
                    % Get the number inside the parentheses
                    number = equation(j + 1:k - 1);                    
                    % Create the nthroot replacement
                    replacement = ['nthroot(' number ', 3)'];
                    updated_equation = [updated_equation replacement];
                    i = k + 1;  % Move past the closing parenthesis
                    continue;
                end
            end
        end
        
        % If no cube root pattern found, just add the current character
        updated_equation = [updated_equation equation(i)];
        i = i + 1;
    end
    
    % Display the final updated equation
    disp(['Final Updated Equation: ', updated_equation]);
end
