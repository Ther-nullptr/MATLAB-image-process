load('data/hall.mat');
load('data/JpegCoeff');
P = double(hall_gray);

[~, ~, h, w] = jpeg_encode_with_params(P, 'jpegcodes_2.mat', QTAB/2, DCTAB, ACTAB);
jpeg = jpeg_decode_with_params('jpegcodes_2.mat', QTAB/2, DCTAB, ACTAB);

subplot(1,2,1);
imshow(uint8(hall_gray));
title("original");

subplot(1,2,2);
imshow(uint8(jpeg));
title("jpeg");

mse = sum((double(jpeg) - double(hall_gray)).^2, 'all')/(h*w);
psnr = 10*log10(255 * 255 / mse);
disp(psnr);