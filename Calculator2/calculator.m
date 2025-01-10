function calculator()
    fig = figure('Name', 'Scientific Calculator', 'NumberTitle', 'off', 'Position', [500, 100, 400, 600]);

    % Display field for the equation
    equation_display = uicontrol('Style', 'text', 'String', '', ...
        'Position', [10, 540, 380, 50], ...
        'HorizontalAlignment', 'right', ...
        'FontSize', 14, ...
        'BackgroundColor', [0.9, 0.9, 0.9]);

    % Display field for the result
    result_display = uicontrol('Style', 'text', 'String', '', ...
        'Position', [10, 500, 380, 40], ...
        'HorizontalAlignment', 'right', ...
        'FontSize', 22, ...
        'BackgroundColor', [0.8, 0.8, 0.8]);

    % Buttons and layout
    buttons = {
            'sin', 'cos', 'tan', 'sqrt', ...
                '(', ')', '^', '/', ...
                'e', 'pi', '!', 'mod', ...
                '7', '8', '9', '*', ...
                '4', '5', '6', '-', ...
                '1', '2', '3', '+', ...
                'C', '0', '=', '←'
            };

    button_width = 85;
    button_height = 60;
    x_spacing = 10;
    y_spacing = 10;

    % Update layout to fit new button arrangement and move buttons down
    x_pos = 10:x_spacing + button_width:10 + 3 * (button_width + x_spacing);
    y_pos = linspace(430, 430 - (8 - 1) * (button_height + y_spacing), 8);

    % Store the current equation
    equation = '';

    % Button actions and logic
    for i = 1:7

        for j = 1:4
            button_idx = (i - 1) * 4 + j;

            if button_idx > length(buttons)
                break;
            end

            uicontrol('Style', 'pushbutton', 'String', buttons{button_idx}, ...
                'Position', [x_pos(j), y_pos(i), button_width, button_height], ...
                'FontSize', 12, 'Callback', @(src, ~) button_logic(get(src, 'String')));
        end

    end

    function button_logic(button_value)

        if strcmp(button_value, 'C')
            equation = ''; % Clear the equation
            set(equation_display, 'String', '');
            set(result_display, 'String', '');
            
        elseif strcmp(button_value, '←')
            if equation(end) == 'i'
                equation = equation (1:end-2);
                set(equation_display, 'String', equation);
            elseif equation(end) == 'd' || equation(end) == 'n' || equation(end) == 's'
                equation = equation (1:end-3);
                set(equation_display, 'String', equation);
            elseif equation(end) == 't'
                equation = equation (1:end-4);
                set(equation_display, 'String', equation);
            else
                equation = equation(1:end-1);
                set(equation_display, 'String', equation);
            end
        elseif strcmp(button_value, '=')
            try
                % Replace mathematical functions with MATLAB equivalents
                equation = strrep(equation, 'sin', 'sind');
                equation = strrep(equation, 'cos', 'cosd');
                equation = strrep(equation, 'tan', 'tand');
                equation = strrep(equation, 'sqrt', 'sqrt');
                equation = strrep(equation, '^', '.^');
                equation = strrep(equation, 'π', '*pi');
                equation = strrep(equation, '!', 'factorial');
                equation = strrep(equation, 'mod', 'mod');

                result = eval(equation); % Evaluate the equation
                set(result_display, 'String', num2str(result)); % Show the result
                equation = ['(' equation ')' ];
                set(equation_display, 'String', equation); % Clear the equation display
            catch
                if isempty(equation)
                    set(result_display, 'String', 'Empty'); 
                else
                    set(result_display, 'String', 'Error'); % Handle errors
                    equation = '';
                    set(equation_display, 'String', '');
                end
            end

        else
            equation = [equation button_value]; % Append button value to equation
            set(equation_display, 'String', equation); % Update the equation display
        end

    end

    pause;
end
