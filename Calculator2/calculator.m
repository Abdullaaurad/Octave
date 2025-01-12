function calculator()
    fig = figure('Name', 'Scientific Calculator', 'NumberTitle', 'off', 'Position', [500, 100, 400, 600]);

    equation_display = uicontrol('Style', 'text', 'String', '', ...
        'Position', [10, 540, 380, 50], ...
        'HorizontalAlignment', 'right', ...
        'FontSize', 14, ...
        'BackgroundColor', [0.9, 0.9, 0.9]);

    result_display = uicontrol('Style', 'text', 'String', '', ...
        'Position', [10, 500, 380, 40], ...
        'HorizontalAlignment', 'right', ...
        'FontSize', 22, ...
        'BackgroundColor', [0.8, 0.8, 0.8]);

    buttons = {
            'sin', 'cos', 'tan', 'sqrt', ...
                '(', ')', '^', '/', ...
                'e', 'π', '!', 'mod', ...
                '7', '8', '9', '*', ...
                '4', '5', '6', '-', ...
                '1', '2', '3', '+', ...
                'C', '0', '=', '←'
            };

    button_width = 85;
    button_height = 60;
    x_spacing = 10;
    y_spacing = 10;

    x_pos = 10:x_spacing + button_width:10 + 3 * (button_width + x_spacing);
    y_pos = linspace(430, 430 - (8 - 1) * (button_height + y_spacing), 8);

    equation = '';
    input_equation = '';

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
        input_equation = equation;
        disp(input_equation);

        if strcmp(button_value, 'C')
            equation = '';
            set(equation_display, 'String', '');
            set(result_display, 'String', '');
            
        elseif strcmp(button_value, '←')
            if ~isempty(equation)
                if equation(end) == 'i'
                    equation = equation(1:end-2);
                elseif equation(end) == 'd' || equation(end) == 'n' || equation(end) == 's'
                    equation = equation(1:end-3);
                elseif equation(end) == 't'
                    equation = equation(1:end-4);
                else
                    equation = equation(1:end-1);
                end
            end
            set(equation_display, 'String', equation);
        elseif strcmp(button_value, '=')
            try

                equation = strrep(equation, 'sin', 'sind');
                equation = strrep(equation, 'cos', 'cosd');
                equation = strrep(equation, 'tan', 'tand');
                equation = strrep(equation, 'sqrt', 'sqrt');
                equation = strrep(equation, '^', '.^');
                equation = updated_pi(equation);
                equation = updated_fac(equation);
                equation = parentheses(equation);
                equation = updated_mod(equation);
                equation = strrep(equation, 'mod', 'mod');

                result = eval(equation);
                set(result_display, 'String', num2str(result));
                input_equation = ['(' input_equation ')' ];
                set(equation_display, 'String', input_equation);
                equation = input_equation;
            catch
                if isempty(equation)
                    set(result_display, 'String', 'Empty'); 
                else
                    set(result_display, 'String', 'Error');
                    equation = '';
                    set(equation_display, 'String', '');
                end
            end

        else
            equation = [equation button_value];
            set(equation_display, 'String', equation);
        end

    end

    pause;
end
