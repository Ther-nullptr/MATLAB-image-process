function [ac_decode_data] = ac_decode(ac_stream, ACTAB)
    len = length(ac_stream);
    huffman_code_temp = '';
    huffman_code_dict = ac_huffman_tree_dict(ACTAB);
    ac_decode_data_vec = zeros(1,63);
    ac_decode_data = [];
    i = 1;
    idx = 1;
    
    ZRL = '11111111001';
    EOB = '1010';
    
    % diff decode
    while i <= len
        huffman_code_temp = strcat(huffman_code_temp, ac_stream(i));
        if(isKey(huffman_code_dict, huffman_code_temp))
            % get the decode data's length
            raw_data = huffman_code_dict(huffman_code_temp);
            binary_data_run = floor(raw_data / 10);
            binary_data_size = mod(raw_data, 10);
            while(binary_data_run > 0)
                idx = idx + 1;
                binary_data_run = binary_data_run - 1;
            end
            % get the binary code
            i = i + 1;
            if(binary_data_size)
                binary_code = ac_stream(i:i + binary_data_size - 1);
            else
                binary_code = '';
            end
            % decode data
            ac_decode_data_vec(idx) = binary_decode(binary_code);
            idx = idx + 1;
            % reset the huffman code
            huffman_code_temp = ''; 
            % jump
            i = i + binary_data_size;
        elseif(strcmp(huffman_code_temp, ZRL) == 1)
            for j = 1:16
                 idx = idx + 1;
            end
            i = i + 1;
            huffman_code_temp = '';
        elseif(strcmp(huffman_code_temp, EOB) == 1)
            ac_decode_data = [ac_decode_data; ac_decode_data_vec];
            ac_decode_data_vec = zeros(1,63);
            i = i + 1;
            idx = 1;
            huffman_code_temp = '';
        else
            i = i + 1;
        end
    end
    ac_decode_data = ac_decode_data';
end
