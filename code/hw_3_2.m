load('data/hall.mat');
load('data/JpegCoeff.mat');

hall_gray = double(hall_gray);
[h, w] = size(hall_gray);

[dc_code, ac_code, h, w, info_1] = jpeg_encode_with_info(double(hall_gray), 'method_1', QTAB, DCTAB, ACTAB, 'method_1');
[hall_gray_decode_1, info_decode_1] = jpeg_decode_with_info('method_1', QTAB, DCTAB, ACTAB, 'method_1');

[dc_code, ac_code, h, w, info_2_1] = jpeg_encode_with_info(double(hall_gray), 'method_2_1', QTAB, DCTAB, ACTAB, 'method_2_1');
[hall_gray_decode_2_1, info_decode_2_1] = jpeg_decode_with_info('method_2_1', QTAB, DCTAB, ACTAB, 'method_2_1');

[dc_code, ac_code, h, w, info_2_2] = jpeg_encode_with_info(double(hall_gray), 'method_2_2', QTAB, DCTAB, ACTAB, 'method_2_2');
[hall_gray_decode_2_2, info_decode_2_2] = jpeg_decode_with_info('method_2_2', QTAB, DCTAB, ACTAB, 'method_2_2');

[dc_code, ac_code, h, w, info_2_3] = jpeg_encode_with_info(double(hall_gray), 'method_2_3', QTAB, DCTAB, ACTAB, 'method_2_3');
[hall_gray_decode_2_3, info_decode_2_3] = jpeg_decode_with_info('method_2_3', QTAB, DCTAB, ACTAB, 'method_2_3');

[dc_code, ac_code, h, w, info_3] = jpeg_encode_with_info(double(hall_gray), 'method_3', QTAB, DCTAB, ACTAB, 'method_3');
[hall_gray_decode_3, info_decode_3] = jpeg_decode_with_info('method_3', QTAB, DCTAB, ACTAB, 'method_3');

subplot(2,3,1);
imshow(uint8(hall_gray));
title("original");

subplot(2,3,2);
imshow(uint8(hall_gray_decode_1));
title("method 1");

subplot(2,3,3);
imshow(uint8(hall_gray_decode_2_1));
title("method 2-1");

subplot(2,3,4);
imshow(uint8(hall_gray_decode_2_2));
title("method 2-2");

subplot(2,3,5);
imshow(uint8(hall_gray_decode_2_3));
title("method 2-3");

subplot(2,3,6);
imshow(uint8(hall_gray_decode_3));
title("method 3");

disp(['method 1 PSNR:' , num2str(psnr(hall_gray, hall_gray_decode_1, h, w))]);
disp(['method 2_1 PSNR:' , num2str(psnr(hall_gray, hall_gray_decode_2_1, h, w))]);
disp(['method 2_2 PSNR:' , num2str(psnr(hall_gray, hall_gray_decode_2_2, h, w))]);
disp(['method 2_3 PSNR:' , num2str(psnr(hall_gray, hall_gray_decode_2_3, h, w))]);
disp(['method 3 PSNR:' , num2str(psnr(hall_gray, hall_gray_decode_3, h, w))]);

disp(['method 1 compress ratio:' , num2str(calculate_compress_ratio('method_1'))]);
disp(['method 2_1 compress ratio:' , num2str(calculate_compress_ratio('method_2_1'))]);
disp(['method 2_2 compress ratio:' , num2str(calculate_compress_ratio('method_2_2'))]);
disp(['method 2_3 compress ratio:' , num2str(calculate_compress_ratio('method_2_3'))]);
disp(['method 3 compress ratio:' , num2str(calculate_compress_ratio('method_3'))]);


disp(['method 1 correct ratio:' , num2str(calculate_correct_ratio(info_1, info_decode_1))]);
disp(['method 2_1 correct ratio:' , num2str(calculate_correct_ratio(info_2_1, info_decode_2_1))]);
disp(['method 2_2 correct ratio:' , num2str(calculate_correct_ratio(info_2_2, info_decode_2_2))]);
disp(['method 2_3 correct ratio:' , num2str(calculate_correct_ratio(info_2_3, info_decode_2_3))]);
disp(['method 3 correct ratio:' , num2str(calculate_correct_ratio(info_3, info_decode_3))]);
