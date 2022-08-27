load('data/hall.mat')
P = double(hall_gray(1:120,1:120));
subplot(1,4,1);
imshow(uint8(P));
title('original');

[height, width] = size(P);
D_1 = get_dct_params(height);
D_2 = get_dct_params(width);

% DCT with transpose
C = D_1 * P *D_2';

% IDCT with transpose
P1 = D_1' * C' * D_2;
subplot(1,4,2);
imshow(uint8(P1));
title('transpose');

% IDCT with rot 90
P2 = D_1' * rot90(C) * D_2;
subplot(1,4,3);
imshow(uint8(P2));
title('rot 90');

% IDCT with rot 180
P2 = D_1' * rot90(C,2) * D_2;
subplot(1,4,4);
imshow(uint8(P2));
title('rot 180');
