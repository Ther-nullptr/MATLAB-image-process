l = 4;
block_size = 10;
threshold = 0.6;

P = imread('data/test_3.bmp');

[h, w, c] = size(P);
P_3 = imresize(P, [h, w*2],'nearest');
get_face_area(P_3, ref_destiny, l, threshold, block_size);
title('enlarge width');

