function [dc_code] = dc_encode(params, DCTAB)
    dc_params = params(1, :)';
    dc_params_diff = [];
    dc_params_diff(1) = dc_params(1);
    dc_len = length(dc_params);
    
    % diff, and code
    dc_code = strcat(huffman_encode(dc_params_diff(1), DCTAB), binary_encode(dc_params_diff(1)));
    for i = 2:dc_len
        dc_params_diff(i) = dc_params(i-1) - dc_params(i);
        huffman_code = huffman_encode(dc_params_diff(i), DCTAB);
        binary_code = binary_encode(dc_params_diff(i));
        dc_code = strcat(dc_code, huffman_code, binary_code);
    end
end

