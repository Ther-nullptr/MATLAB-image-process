load('data/hall.mat')
test_img = double(hall_gray(1:8,1:8));

result_1 = dct2(test_img);
result_2 = my_dct(test_img);

disp(result_1);
disp(result_2);

disp(sum(sum(abs(result_1 - result_2))));