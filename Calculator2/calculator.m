function calculator()
    % Create the figure
    fig = figure('Name', 'Enhanced Scientific Calculator', 'NumberTitle', 'off', ...
        'Position', [300, 90, 550, 680], 'Color', [0.95, 0.95, 0.95]);

    % Displays for equation and result
    equation_display = uicontrol('Style', 'text', 'String', '', ...
        'Position', [10, 600, 530, 60], ...
        'HorizontalAlignment', 'right', ...
        'FontSize', 14, ...
        'BackgroundColor', [0.9, 0.9, 0.9]);

    result_display = uicontrol('Style', 'text', 'String', '', ...
        'Position', [10, 540, 530, 60], ...
        'HorizontalAlignment', 'right', ...
        'FontSize', 20, ...
        'FontWeight', 'bold', ...
        'BackgroundColor', [0.8, 0.8, 0.8]);

    % Button layout
    buttons = {
        'INV', 'DEG', 'RAD', 'GRAD', 'MOD', 'AC';
        'sinh', 'sin', '7', '8', '9', '/';
        'cosh', 'cos', '4', '5', '6', '*';
        'tanh', 'tan', '1', '2', '3', '-';
        'pi', 'e', '0', '.', '=', '+';
        'x²', 'x³', '√', '∛', '^', 'mod';
        'log', ',', '(', ')', '←', 'C';
        'MIN', 'MAX', 'AVG', 'M+', 'M-', 'MR';
        'BIN', 'OCT', 'HEX', 'ABS', 'RAND', 'ANS'
    };

    % Dimensions and spacing for buttons
    button_width = 80;
    button_height = 50;
    x_spacing = 10;
    y_spacing = 10;
    x_start = 10;
    y_start = 485;

    [rows, cols] = size(buttons);
    equation = ''; % Current equation
    memory = []; % For memory functions
    angle_mode = 'RAD'; % Default angle mode (RAD)

    % Create buttons
    for i = 1:rows
        for j = 1:cols
            button_text = buttons{i, j};
            x_pos = x_start + (j - 1) * (button_width + x_spacing);
            y_pos = y_start - (i - 1) * (button_height + y_spacing);

            % Set button color
            if strcmp(button_text, '=')
                bg_color = [1, 0.4, 0.4]; % Red for "=" button
            elseif ismember(button_text, {'C', 'AC', '←'})
                bg_color = [1, 0.8, 0.6]; % Light orange for control buttons
            elseif ismember(button_text, {'+', '-', '*', '/', '^', 'mod'})
                bg_color = [0.6, 0.8, 1]; % Light blue for operators
            else
                bg_color = [0.9, 0.9, 0.9]; % Default button color
            end

            % Create the button
            uicontrol('Style', 'pushbutton', 'String', button_text, ...
                'Position', [x_pos, y_pos, button_width, button_height], ...
                'FontSize', 12, ...
                'BackgroundColor', bg_color, ...
                'Callback', @(src, ~) button_logic(get(src, 'String')));
        end
    end

    memory = []; % Initialize memory as an empty array

    % Button logic
    function button_logic(button_value)
        functions_with_parenthesis = {'sin', 'cos', 'tan', 'sinh', 'cosh', 'tanh', 'log', 'ln', '√', '∛', 'BIN', 'OCT', 'HEX', 'ABS'};
        switch button_value
            case 'DEG' % Switch to DEG mode
                angle_mode = 'DEG';
                set(result_display, 'String', 'Mode: DEG');
            case 'RAD' % Switch to RAD mode
                angle_mode = 'RAD';
                set(result_display, 'String', 'Mode: RAD');
            case 'GRAD' % Switch to GRAD mode
                angle_mode = 'GRAD';
                set(result_display, 'String', 'Mode: GRAD');
            case {'sin', 'cos', 'tan', 'sinh', 'cosh', 'tanh'}
                % Append trigonometric functions with angle mode conversion
                if ismember(button_value, {'sin', 'cos', 'tan'})
                    equation = [equation, button_value, '(', angle_conversion('(', button_value)];
                else
                    equation = [equation, button_value, '('];
                end
                set(equation_display, 'String', equation);
            case '=' % Evaluate the equation
                try
                    formatted_equation = format_equation(equation);
                    result = eval(formatted_equation);
                    set(result_display, 'String', num2str(result));
                catch
                    set(result_display, 'String', 'Error');
                end
            case 'ANS'
                if isempty(memory)
                    set(result_display, 'String', 'Memory Empty');
                else
                    equation = [equation, num2str(memory(end))]; % Use the most recent memory value
                    set(equation_display, 'String', equation);
                end            
            case 'M+'
                try
                    if isempty(get(result_display, 'String')) && ~isempty(equation)
                        formatted_equation = format_equation(equation);
                        current_result = eval(formatted_equation);
                        memory = [memory, current_result];
                        set(result_display, 'String', 'Stored in Memory');
                    else
                        % Store the result directly from the display
                        current_result = str2double(get(result_display, 'String'));
                        if isnan(current_result)
                            return; % Do nothing if the result is not a valid number
                        end
                        memory = [memory, current_result]; % Append the result to memory
                        set(result_display, 'String', 'Stored in Memory');
                    end
                catch
                    set(result_display, 'String', 'Error');
                end
                
            case 'M-'
                try
                    if ~isempty(equation) && isempty(get(result_display, 'String'))
                        % Evaluate the equation first
                        formatted_equation = format_equation(equation);
                        current_result = eval(formatted_equation);
                    else
                        % Use the currently displayed result
                        current_result = str2double(get(result_display, 'String'));
                    end
            
                    % If memory is empty, show a message
                    if isempty(memory)
                        set(result_display, 'String', 'Memory Empty');
                        return;
                    end
            
                    % Remove the last value from memory
                    memory(end) = []; % Pop the last value from the array
                    set(result_display, 'String', 'Last Memory Removed');
                catch
                    set(result_display, 'String', 'Error');
                end            
            case 'MR'
                if isempty(memory)
                    set(result_display, 'String', 'Memory Empty');
                else
                    memory_str = sprintf('%.4g, ', memory);
                    memory_str = memory_str(1:end-2);
                    set(result_display, 'String', memory_str);
                end
            case 'C' % Clear equation
                equation = '';
                set(equation_display, 'String', '');
                set(result_display, 'String', '');
            case 'AC' % Clear all
                equation = '';
                memory = [];
                set(equation_display, 'String', '');
                set(result_display, 'String', '');
            case '←' % Backspace
                equation = backspace(equation);
                set(equation_display, 'String', equation);
            otherwise % Append other button values
                if ismember(button_value, functions_with_parenthesis)
                    equation = [equation, button_value, '('];
                else
                    equation = [equation, button_value];
                end
                set(equation_display, 'String', equation);
        end
    end

    function equation = backspace(equation)
        if ~isempty(equation)
            equation = equation(1:end-1);
        end
    end

    function result = angle_conversion(angle_expr, trig_func)
        if strcmp(angle_mode, 'DEG')
            result = sprintf('(pi/180)*%s', angle_expr);
        elseif strcmp(angle_mode, 'GRAD')
            result = sprintf('(pi/200)*%s', angle_expr);
        else
            result = angle_expr;
        end
    end

    function formatted_equation = format_equation(eq)
        formatted_equation = eq;
        formatted_equation = updated_pi(formatted_equation);
        formatted_equation = updated_fac(formatted_equation);
        formatted_equation = parentheses(formatted_equation);
        formatted_equation = strrep(formatted_equation, 'MIN', 'min');
        formatted_equation = strrep(formatted_equation, 'MAX', 'max');
        formatted_equation = strrep(formatted_equation, 'AVG', 'avg');
        formatted_equation = strrep(formatted_equation, 'MOD', 'mod');
        formatted_equation = updated_mod(formatted_equation);
        formatted_equation = updated_cuberoot(formatted_equation);
        formatted_equation = strrep(formatted_equation, '10^', '10.^');
        formatted_equation = strrep(formatted_equation, 'exp', 'exp');
        formatted_equation = strrep(formatted_equation, '1/(', '1./(');
        formatted_equation = strrep(formatted_equation, '²', '^2');
        formatted_equation = strrep(formatted_equation, '³', '^3');
        formatted_equation = strrep(formatted_equation, '√', 'sqrt');
        formatted_equation = strrep(formatted_equation, '∛', 'nthroot');
        formatted_equation = strrep(formatted_equation, 'e', 'exp(1)');
    end
    pause;

end