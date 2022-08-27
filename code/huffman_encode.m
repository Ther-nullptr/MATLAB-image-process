function [huffman_code] = huffman_encode(num, DCTAB)
    if(num == 0)
        category = 0;
    else
        category = floor(log2(abs(num))) + 1;
    end
    
    huffman_code_length = DCTAB(category + 1,1);
    huffman_code = DCTAB(category + 1, 2:1 + huffman_code_length);
    huffman_code = num2str(huffman_code);
    huffman_code = strrep(huffman_code, ' ', '');
end

