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

    % Backspace logic
    function equation = backspace(equation)
        if ~isempty(equation)
            equation = equation(1:end-1);
        end
    end

    % Angle conversion logic for trigonometric functions
    function result = angle_conversion(angle_expr, trig_func)
        if strcmp(angle_mode, 'DEG')
            result = sprintf('(pi/180)*%s', angle_expr);
        elseif strcmp(angle_mode, 'GRAD')
            result = sprintf('(pi/200)*%s', angle_expr);
        else
            result = angle_expr; % RAD mode (no conversion needed)
        end
    end

    function formatted_equation = format_equation(eq)
        formatted_equation = eq;
        formatted_equation = updated_pi(formatted_equation);
        formatted_equation = updated_fac(formatted_equation);
        formatted_equation = parentheses(formatted_equation);
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