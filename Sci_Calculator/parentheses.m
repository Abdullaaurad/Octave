function updated_equation = parentheses(equation)
    updated_equation = '';
    i = 1;

    while i < length(equation)
        if equation(i) == ')' && i < length(equation) && equation(i+1) == '('
            equation = [equation(1:i), '*', equation(i+1:end)];
            i = 0;
        end
        i = i + 1;
    end

    updated_equation = equation;
end
