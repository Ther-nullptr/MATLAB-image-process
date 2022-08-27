function [run_size_code] = run_size_encode(run, size, ACTAB)
    if(size == 0)
        category = 0;
    else
        category = floor(log2(abs(size))) + 1;
    end
    idx = run*10 + category;
    code_length = ACTAB(idx,3);
    run_size_code = ACTAB(idx,4:4+code_length-1);
    run_size_code = num2str(run_size_code);
    run_size_code = strrep(run_size_code, ' ', '');
end

