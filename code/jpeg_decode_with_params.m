function [picture] = jpeg_decode_with_params(stream_file, QTAB, DCTAB, ACTAB)
    load(stream_file);
    
    picture = zeros(h, w);
    % decode
    dc_matrix = dc_decode(dc_code, DCTAB);
    ac_matrix = ac_decode(ac_code, ACTAB);
    full_matrix = [dc_matrix; ac_matrix];

    % inv zig zag & inv quat
    block_h = h/8;
    block_w = w/8;
    k = 1;

    for i = 0:block_h - 1
        for j = 0:block_w - 1
            block = full_matrix(:,k);
            block = inv_zig_zag(block);
            block = block.*QTAB;
            block = idct2(block);
            block = block + 128;
            picture(8*i + 1: 8*(i+1),8*j + 1:8*(j+1)) = uint8(block);
            k = k + 1;
        end
    end
end

