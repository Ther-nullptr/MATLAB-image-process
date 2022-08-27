function [huffman_tree_dict] = ac_huffman_tree_dict(ACTAB)
    [code_num, len] = size(ACTAB);
    huffman_tree_dict = containers.Map();
    
    for i = 1:code_num
        % get huffman code
        huffman_code_length = ACTAB(i,3);
        huffman_code = ACTAB(i, 4:3 + huffman_code_length);
        huffman_code = num2str(huffman_code);
        huffman_code = strrep(huffman_code, ' ', '');
        huffman_tree_dict(huffman_code) = i;
    end
end

