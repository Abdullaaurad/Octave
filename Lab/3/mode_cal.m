function M = mode_cal(A)
    unique_vals = unique(A);

    freq = histc(A, unique_vals);
    
    [~, idx] = max(freq);
    M = unique_vals(idx);
end