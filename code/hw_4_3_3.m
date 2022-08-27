l = 4;
block_size = 10;
threshold = 0.6;

P = imread('data/test_3.bmp');

P_4 = imadjust(P,[.2 .3 0; .6 .7 1],[]);
get_face_area(P_4, ref_destiny, l, threshold, block_size);
title('adjust the color');