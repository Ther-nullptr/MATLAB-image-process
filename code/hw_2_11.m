load('data/hall.mat');
load('data/JpegCoeff.mat');
[h, w] = size(hall_gray);

subplot(1,2,1);
imshow(uint8(hall_gray));
title("original");

jpeg = jpeg_decode_with_params('jpegcodes.mat', QTAB, DCTAB, ACTAB);
subplot(1,2,2);
imshow(uint8(jpeg));
title("jpeg");

mse = sum((double(jpeg) - double(hall_gray)).^2, 'all') / (h * w);
psnr = 10*log10(255*255/mse);
disp(psnr);