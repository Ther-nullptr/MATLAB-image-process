function [huffman_tree_dict] = dc_huffman_tree_dict(DCTAB)
    [code_num, len] = size(DCTAB);
    huffman_tree_dict = containers.Map();
    
    for i = 1:code_num
        % get huffman code
        huffman_code_length = DCTAB(i,1);
        huffman_code = DCTAB(i, 2:1 + huffman_code_length);
        huffman_code = num2str(huffman_code);
        huffman_code = strrep(huffman_code, ' ', '');
        huffman_tree_dict(huffman_code) = i - 1;
    end
end

