load('data/hall.mat');
load('data/JpegCoeff');
P = double(hall_gray);
[dc_code, ac_code, h, w] = jpeg_encode_with_params(P, 'jpegcodes.mat', QTAB, DCTAB, ACTAB);
disp(length(dc_code));
disp(length(ac_code));
