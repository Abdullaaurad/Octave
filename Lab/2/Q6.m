positive_real = 5;
negative_real = -5;
imaginary_num = 3i;

result1 = Inf / positive_real;
result2 = Inf / 0;
result3 = Inf / negative_real;
result4 = Inf / imaginary_num;

% Display results
fprintf("Inf / positive_real: %f\n", result1);
fprintf("Inf / 0: %f\n", result2);
fprintf("Inf / negative_real: %f\n", result3);
fprintf("Inf / imaginary_num: %f + %fi\n", real(result4), imag(result4));

% Inf/3i
% -Inf i^2/3i
% -Inf i