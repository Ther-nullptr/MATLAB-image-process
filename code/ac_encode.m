function [ac_code] = ac_encode(params, ACTAB)
    ZRL = '11111111001';
    EOB = '1010';
    ac_code  = '';
    ac_params = params(2:end, :);
    for i = 1:size(ac_params, 2)
        vec = ac_params(:,i); % params after zigzag
        zero_num = 0;
        for j = 1:length(vec)
            if vec(j) ~= 0
                while zero_num >= 16
                    ac_code = strcat(ac_code, ZRL);
                    zero_num = zero_num - 16;
                end
                ac_code = strcat(ac_code, run_size_encode(zero_num, vec(j), ACTAB));
                ac_code = strcat(ac_code, binary_encode(vec(j)));
                zero_num = 0;
            else
                zero_num = zero_num + 1;
            end
        end
        ac_code = strcat(ac_code, EOB); 
    end
end

