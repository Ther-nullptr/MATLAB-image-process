load('data/hall.mat')
P = double(hall_gray(80:88,80:88));
subplot(3,1,1);
imshow(uint8(P));
title('original');

% DCT with right
[height, width] = size(P);
D_1 = get_dct_params(height);
D_2 = get_dct_params(width);

C = D_1 * P * D_2';
C(:,end-3:end) = 0;

% IDCT with right

P1 = D_1' * C * D_2;
subplot(3,1,2);
imshow(uint8(P1));
title('right 0');

% DCT with left
C = D_1 *P *D_2';
C(:,1:4) = 0;

% IDCT with left

P2 = D_1' * C * D_2;
subplot(3,1,3);
imshow(uint8(P2));
title('left 0');