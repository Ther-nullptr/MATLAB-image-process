load('data/hall.mat');
load('data/JpegCoeff.mat');

[h, w] = size(hall_gray);

% random info
hidden_info = uint8(randi([0 1],h*w,1));
hidden_info = reshape(hidden_info, h, w);
% set info
image_with_info = bitset(hall_gray, 1, hidden_info);
% encode and decode 
[dc_code, ac_code, h, w] = jpeg_encode_with_params(double(image_with_info), 'method_0', QTAB, DCTAB, ACTAB);
image_with_info_decode = jpeg_decode_with_params('method_0', QTAB, DCTAB, ACTAB);
% get info
hidden_info_decode = bitget(uint8(image_with_info_decode), 1);
correct_num = sum(sum(~xor(hidden_info, hidden_info_decode)));
correct_ratio = correct_num/(h*w);
disp(correct_ratio);

psnr1= psnr(hall_gray, image_with_info_decode, h, w);

subplot(1,3,1);
imshow(uint8(hall_gray));
title("original");

subplot(1,3,2);
imshow(uint8(image_with_info));
title("picture with info");

subplot(1,3,3);
imshow(uint8(image_with_info_decode));
title("picture with info deocde");