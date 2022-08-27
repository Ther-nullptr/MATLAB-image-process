function [dc_decode_data] = dc_decode(dc_stream, DCTAB)
    len = length(dc_stream);
    huffman_code_temp = '';
    huffman_code_dict = dc_huffman_tree_dict(DCTAB);
    dc_decode_data = [];
    i = 1;
    
    % diff decode
    while i <= len
        huffman_code_temp = strcat(huffman_code_temp, dc_stream(i));
        if(isKey(huffman_code_dict, huffman_code_temp))
            % get the decode data's length
            dc_decode_data_length = huffman_code_dict(huffman_code_temp);
            % get the binary code
            i = i + 1;
            if(dc_decode_data_length)
                binary_code = dc_stream(i:i + dc_decode_data_length - 1);
            else
                binary_code = '';
            end
            % decode data
            dc_decode_data = [dc_decode_data, binary_decode(binary_code)];
            % reset the huffman code
            huffman_code_temp = ''; 
            % jump
            i = i + dc_decode_data_length;
        else
            i = i + 1;
        end
    end
    
    % sum
    for i = 1:length(dc_decode_data) - 1
        dc_decode_data(i+1) = dc_decode_data(i) - dc_decode_data(i+1);
    end
end
