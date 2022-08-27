function [category_code] = binary_encode(num)
    if(num == 0)
        category_code = '';
    else
        category_code = dec2bin(abs(num));
    end
    if(num < 0)
        for i = 1:length(category_code)
            category_code(i) = num2str(~str2num(category_code(i)));
        end
    end
end

