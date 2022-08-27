load('data/hall.mat')
test_img = double(hall_gray(1:8,1:8));

result_1 = dct2(test_img - 128);
result_2 = dct2(test_img);
result_2(1,1) = result_2(1,1) - 128*8;

disp(sum(sum(abs(result_1 - result_2))));