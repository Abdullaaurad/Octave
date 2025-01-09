words = {"if", "when", "while", "how", "which", "catch", "try", "until", "spmd", ...
        "spot", "partfor", "for", "global", "else", "e", "pi", "__FINE__", ...
        "__LINE__", "break", "broke", "function"};
    
% Check each word
for i = 1:length(words)
    fprintf("%s is a keyword: %d\n", words{i}, iskeyword(words{i}));
end
