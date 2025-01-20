
function calculator()

    fig = figure('Name', 'Advanced Scientific Calculator',
                  'NumberTitle', 'off',
                  'Position', [100, 100, 450, 650],
                  'Color', [0.2 0.2 0.2],
                  'MenuBar', 'none');

    history = uicontrol('Style', 'listbox',
                         'Position', [10, 570, 430, 70],
                         'FontSize', 12,
                         'BackgroundColor', [0.95 0.95 0.95],
                         'ForegroundColor', [0 0 0]);

    display = uicontrol('Style', 'edit',
                        'Position', [10, 520, 430, 40],
                        'FontSize', 12,
                        'FontWeight', 'bold',
                        'HorizontalAlignment', 'right',
                        'BackgroundColor', [0.9 1 0.9],
                        'String', '0');

    buttons = {
        'INV', 'DEG', 'RAD' , 'GRAD', '%', 'AC';
        'sinh', 'sin', '7', '8', '9', '/';
        'cosh', 'cos', '4', '5', '6', '*';
        'tanh', 'tan', '1', '2', '3', '-';
        'π', 'e', '0', '.', '=', '+';
        'x²', 'x³', '√', '∛', '^', 'mod';
        'log', 'ln', '(', ')', '←', 'C';
        'MIN', 'MAX', 'AVG', 'M+', 'M-', 'MR';
        'BIN', 'OCT', 'HEX', 'ABS', 'RAND', 'ANS';
        };

    button_types = {
        'function', 'function', 'function', 'function', 'function', 'clear';
        'trig', 'trig', 'number', 'number', 'number', 'operator';
        'trig', 'trig', 'number', 'number', 'number', 'operator';
        'trig', 'trig', 'number', 'number', 'number', 'operator';
        'constant', 'constant', 'number', 'number', 'equals', 'operator';
        'power', 'power', 'root', 'root', 'operator', 'operator';
        'function', 'function', 'bracket', 'bracket', 'edit', 'clear';
        'memory', 'memory', 'memory', 'memory', 'memory', 'memory';
        'conversion', 'conversion', 'conversion', 'function', 'function', 'memory'
    };

    button_start_y = 460;
    for i = 1:size(buttons, 1)
      for j = 1:size(buttons, 2)
            btn_type = button_types{i,j};
            btn_color = get_button_color(btn_type);

            uicontrol('Style', 'pushbutton', ...
                     'String', buttons{i,j}, ...
                     'Position', [10+(j-1)*73, button_start_y-(i-1)*45, 70, 40], ...
                     'FontSize', 11, ...
                     'FontWeight', 'bold', ...
                     'BackgroundColor', btn_color, ...
                     'ForegroundColor', [0 0 0], ...
                     'Callback', @(src,event) button_callback(src, display, history));
        end
    end

    % setappdate(fig, 'memory', 0);
    % setappdata(fig, 'angle_mode', 'DEG');
    % setappdate(fig, 'last_answer', 0);
    % setappdata(fig, 'inverse_mode', false);
end

function color = get_button_color(btn_type)

    switch btn_type
        case 'number'
            color = [0.95 0.95 0.95];
        case 'operator'
            color = [0.8 0.8 1];
        case 'function'
            color = [1 0.8 0.8];
        case 'trig'
            color = [0.8 1 0.8];
        case 'memory'
            color = [1 1 0.8];
        case 'conversion'
            color = [0.8 1 1];
        case 'clear'
            color = [1 0.7 0.7];
        case 'equals'
            color = [0.7 1 0.7];
        case 'constant'
            color = [1 0.9 0.8];
        case 'power'
            color = [0.9 0.8 1];
        case 'root'
            color = [0.8 0.9 1];
        case 'bracket'
            color = [0.9 0.9 0.9];
        case 'edit'
            color = [1 0.8 0.8];
        otherwise
            color = [0.9 0.9 0.9];
    end
end

function button_callback(src, display, history)
    button_label = get(src, 'String');
    current_text = get(display, 'String');
    angle_mode = getappdata(gcf, 'angle_mode');
    inverse_mode = getappdata(gcf, 'inverse_mode');
    last_answer = getappdata(gcf, 'last_answer');
    try
        switch button_label
            case 'AC'
                set(display, 'String', '0');
                set(history, 'String', {});
            case 'C'
                set(display, 'String', '0');
            case '←'
                if length(current_text) > 1
                    set(display, 'String', current_text(1:end-1));
                else
                    set(display, 'String', '0');
                end
            case {'DEG', 'RAD', 'GRAD'}
                setappdata(gcf, 'angle_mode', button_label);
            case 'INV'
                setappdata(gcf, 'inverse_mode', ~inverse_mode);
            case '='
                result = evaluate_expression(current_text, angle_mode);
                hist_list = get(history, 'String');
                hist_list = [{[current_text ' = ' num2str(result)]}; hist_list];
                if length(hist_list) > 5
                    hist_list = hist_list(1:5);
                end
                set(history, 'String', hist_list);
                set(display, 'String', num2str(result));
                setappdata(gcf, 'last_answer', result);
            case 'ANS'
                set(display, 'String', num2str(last_answer));
            case 'RAND'
                set(display, 'String', num2str(rand()));
            case {'M+', 'M-', 'MR'}
                handle_memory(button_label, display);
            case {'BIN', 'OCT', 'HEX'}
                handle_conversion(button_label, current_text, display);
            otherwise
                if strcmp(current_text, '0') && ~ismember(button_label, {'.', '+', '-', '*', '/'})
                    set(display, 'String', button_label);
                else
                    set(display, 'String', [current_text button_label]);
                end
        end
    catch
        set(display, 'String', 'Error');
    end
end

function result = evaluate_expression(expr, angle_mode)
    if strcmp(angle_mode, 'DEG')
        expr = replace_trig_deg(expr);
    elseif strcmp(angle_mode, 'GRAD')
        expr = replace_trig_grad(expr);
    end

    expr = strrep(expr, 'π', 'pi');
    expr = strrep(expr, '²', '^2');
    expr = strrep(expr, '³', '^3');
    expr = strrep(expr, '√', 'sqrt');
    expr = strrep(expr, '∛', 'nthroot(3)');

    result = eval(expr);
end

function expr = replace_trig_deg(expr)
    trig_funcs = {'sin', 'cos', 'tan'};
    for i = 1:length(trig_funcs)
        func = trig_funcs{i};
        expr = regexprep(expr, [func '\((.*?)\)'], [func '($1*pi/180)']);
    end
end

function expr = replace_trig_grad(expr)
    trig_funcs = {'sin', 'cos', 'tan'};
    for i = 1:length(trig_funcs)
        func = trig_funcs{i};
        expr = regexprep(expr, [func '\((.*?)\)'], [func '($1*pi/200)']);
    end
end

function handle_memory(operation, display)
    memory = getappdata(gcf, 'memory');
    current_value = str2num(get(display, 'String'));

    switch operation
        case 'M+'
            memory = memory + current_value;
        case 'M-'
            memory = memory - current_value;
        case 'MR'
            set(display, 'String', num2str(memory));
    end

    setappdata(gcf, 'memory', memory);
end

function handle_conversion(type, value, display)
    num = str2num(value);
    switch type
        case 'BIN'
            set(display, 'String', dec2bin(num));
        case 'OCT'
            set(display, 'String', dec2base(num, 8));
        case 'HEX'
            set(display, 'String', dec2hex(num));
    end
end
