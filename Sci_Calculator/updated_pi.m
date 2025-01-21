function updated_equation = updated_pi(equation)

    equation = strrep(equation, 'π', 'pi');
    updated_equation = '';
    i = 1;
    while i <= length(equation)
        if startsWith(equation(i:end), 'pi')
            if i > 1
                prev_char = equation(i - 1);
                if isstrprop(prev_char, 'digit') || prev_char == '.'
                    updated_equation = [updated_equation, '*pi'];
                elseif ismember(prev_char, {'+', '-', '*', '/', '^', '(', })
                    % If it's an operator or parenthesis, no change
                    updated_equation = [updated_equation, 'pi'];
                else
                    error('Invalid character before "pi": "%s"', prev_char);
                end

            else
                updated_equation = [updated_equation, 'pi'];
            end

            i = i + 2;
        else
            updated_equation = [updated_equation, equation(i)];
            i = i + 1;
        end

    end

end
