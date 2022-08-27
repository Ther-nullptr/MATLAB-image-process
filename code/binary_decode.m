function [num] = binary_decode(category_code)
    sign = 1;
    if isempty(category_code)
        num = 0;
    elseif category_code(1) == '0'
        sign = -1;
        for i = 1:length(category_code)
            category_code(i) = num2str(~str2num(category_code(i)));
        end
        num = bin2dec(category_code);
    else
        num = bin2dec(category_code);
    end
    num = num * sign;
end


