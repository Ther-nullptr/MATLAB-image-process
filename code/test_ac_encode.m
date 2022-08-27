        ZRL = '11111111001';
        EOB = '1010';
        vec = [10, 3, 0, 0, 2, zeros(1, 20), 1, zeros(1, 37)];
        ac_code = '';
        zero_num = 0;
        for j = 1:length(vec)
            if vec(j) ~= 0
                if zero_num >= 16
                    ac_code = strcat(ac_code, ZRL);
                    zero_num = zero_num - 16;
                end
                ac_code = strcat(ac_code , run_size_encode(zero_num, vec(j)));
                ac_code = strcat(ac_code , binary_encode(vec(j)));
                zero_num = 0;
            else
                zero_num = zero_num + 1;
            end 
        end
        ac_code = strcat(ac_code, EOB); 
        disp(ac_code);