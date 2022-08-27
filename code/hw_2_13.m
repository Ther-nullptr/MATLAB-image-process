load('data/snow.mat');
load('data/JpegCoeff');
subplot(1,2,1);
imshow(uint8(snow));
title("original");

[~, ~, h, w] = jpeg_encode_with_params(double(snow), 'jpegcodes_snow.mat', QTAB, DCTAB, ACTAB);
jpeg = jpeg_decode_with_params('jpegcodes_snow.mat', QTAB, DCTAB, ACTAB);

jpeg = jpeg_decode_with_params('jpegcodes_snow.mat', QTAB, DCTAB, ACTAB);
subplot(1,2,2);
imshow(uint8(jpeg));
title("jpeg");

mse = sum((double(jpeg) - double(snow)).^2, 'all')/(h*w);
psnr = 10*log10(255*255/mse);
disp(psnr);