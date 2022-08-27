function [dc_code, ac_code, h, w] = jpeg_encode(original_picture, stream_name)
    load('data/JpegCoeff');
    dct_matrix = get_dct_matrix(original_picture);
    dc_code = dc_encode(dct_matrix);
    ac_code = ac_encode(dct_matrix);
    [h, w] = size(original_picture);
    save(stream_name, 'dc_code', 'ac_code', 'h', 'w');
end

