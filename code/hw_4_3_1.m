l = 4;
block_size = 10;
threshold = 0.6;

P = imread('data/test_3.bmp');

P_2 = rot90(P);
get_face_area(P_2, ref_destiny, l, threshold, block_size);
title('rotate 90 degrees');