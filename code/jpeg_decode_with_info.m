function [picture, decode_info] = jpeg_decode_with_info(stream_file, QTAB, DCTAB, ACTAB, method)
    load(stream_file);
    
    picture = zeros(h, w);
    % decode
    dc_matrix = dc_decode(dc_code, DCTAB);
    ac_matrix = ac_decode(ac_code, ACTAB);
    full_matrix = [dc_matrix; ac_matrix];
    [dct_h, dct_w] = size(full_matrix);
    m = median(QTAB, 'all');
    zig_zag_idx = zig_zag(8);
    
    switch (method)
        case('method_1')
            decode_info = bitget(int64(full_matrix), 1);
        case('method_2_1')
            [~, max_idx] = max(QTAB(zig_zag_idx));
            decode_info = bitget(int64(full_matrix(max_idx,:)), 1);
        case('method_2_2')
            random_idx = 32;
            decode_info = bitget(int64(full_matrix(random_idx,:)), 1);
        case('method_2_3')
            [~, min_idx] = min(QTAB(zig_zag_idx));
            decode_info = bitget(int64(full_matrix(min_idx,:)), 1);
        case('method_3')
            decode_info = int8(zeros(dct_w, 1));
            for i = 1:dct_w
                for j = dct_h:-1:1
                    if(full_matrix(j,i) ~= 0)
                        if(full_matrix(j,i) > 0)
                            decode_info(i) = 1;
                        elseif(full_matrix(j,i) < 0)
                            decode_info(i) = 0;
                        end
                        break
                    end
                end
            end
        otherwise
            ME = MException('available options: method_1/method_2_1/method_2_2/method_2_3/method_3');
            throw(ME);
    end

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

