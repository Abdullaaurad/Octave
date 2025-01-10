function calculator()
    % Create the main figure
    fig = figure('Name', 'Calculator', 'NumberTitle', 'off', 'Position', [500, 200, 300, 400]);

    % Display field
    display = uicontrol('Style', 'text', 'String', '', 'Position', [20, 330, 260, 50], ...
        'HorizontalAlignment', 'right', 'FontSize', 14);

    % Create buttons
    buttons = {'7', '8', '9', '/', ...
                '4', '5', '6', '*', ...
                '1', '2', '3', '-', ...
                '0', 'C', '=', '+'};

    % Initialize button positions
    x_pos = [20, 80, 140, 200];
    y_pos = [260, 200, 140, 80];

    % Store current equation
    equation = '';

    % Callback function for buttons
    function button_callback(src, ~)
        button_value = get(src, 'String');

        if strcmp(button_value, 'C')
            equation = ''; % Clear the equation
        elseif strcmp(button_value, '=')

            try
                equation = num2str(eval(equation)); % Evaluate the equation
            catch
                equation = 'Error'; % Handle errors
            end

        else
            equation = [equation button_value]; % Append button value to equation
        end

        set(display, 'String', equation); % Update the display
    end

    % Create buttons dynamically
    for i = 1:4

        for j = 1:4
            button_idx = (i - 1) * 4 + j;
            uicontrol('Style', 'pushbutton', 'String', buttons{button_idx}, ...
                'Position', [x_pos(j), y_pos(i), 50, 50], ...
                'FontSize', 12, 'Callback', @button_callback);
        end

    end

    pause;

end