function [dc_code, ac_code, h, w, hidden_info] = jpeg_encode_with_info(original_picture, stream_name, QTAB, DCTAB, ACTAB, method)
    dct_matrix = get_dct_matrix_with_params(original_picture, QTAB);
    [dct_h, dct_w] = size(dct_matrix);
    hidden_info = uint8(randi([0 1], dct_h * dct_w ,1));
    hidden_info = reshape(hidden_info, dct_h, dct_w);
    [h, w] = size(original_picture);
    zig_zag_idx = zig_zag(8);
    m = median(QTAB, 'all');
    switch (method)
        case('method_1')
            dct_with_info = double(bitset(int64(dct_matrix), 1, hidden_info));
        case('method_2_1')
            [~, max_idx] = max(QTAB(zig_zag_idx));
            dct_with_info = dct_matrix;
            dct_with_info(max_idx,:) = double(bitset(int64(hidden_info(max_idx,:)), 1, hidden_info(max_idx,:)));
            hidden_info = hidden_info(max_idx,:);
        case('method_2_2')
            random_idx = 32;
            dct_with_info = dct_matrix;
            dct_with_info(random_idx,:) = double(bitset(int64(hidden_info(random_idx,:)), 1, hidden_info(random_idx,:)));
            hidden_info = hidden_info(random_idx,:);
        case('method_2_3')
            [~, min_idx] = min(QTAB(zig_zag_idx));
            dct_with_info = dct_matrix;
            dct_with_info(min_idx,:) = double(bitset(int64(hidden_info(min_idx,:)), 1, hidden_info(min_idx,:)));
            hidden_info = hidden_info(min_idx,:);
        case('method_3')
            dct_with_info = dct_matrix;
            hidden_info = int8(hidden_info(1:dct_w));
            hidden_info_tmp = hidden_info;
            for i = 1:length(hidden_info)
                if hidden_info_tmp(i) == 0  
                    hidden_info_tmp(i) = -1;
                end
            end
            idx = 1;
            for i = 1:dct_w
                for j = dct_h:-1:1
                    if(dct_with_info(j, i) ~= 0)
                        if (j ~= dct_h)
                            dct_with_info(j + 1, i) = hidden_info_tmp(idx);
                        else
                            dct_with_info(j, i) = hidden_info_tmp(idx);
                        end
                        break
                    end
                end
                idx = idx + 1;
            end
        otherwise
            ME = MException('available options: method_1/method_2_1/method_2_2/method_2_3/method_3');
            throw(ME);
    end
    dc_code = dc_encode(dct_with_info, DCTAB);
    ac_code = ac_encode(dct_with_info, ACTAB);
    save(stream_name, 'dc_code', 'ac_code', 'h', 'w');
end

