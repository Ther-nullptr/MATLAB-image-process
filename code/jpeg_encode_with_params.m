function [dc_code, ac_code, h, w] = jpeg_encode_with_params(original_picture, stream_name, QTAB, DCTAB, ACTAB)
    dct_matrix = get_dct_matrix_with_params(original_picture, QTAB);
    dc_code = dc_encode(dct_matrix, DCTAB);
    ac_code = ac_encode(dct_matrix, ACTAB);
    [h, w] = size(original_picture);
    save(stream_name, 'dc_code', 'ac_code', 'h', 'w');
end

