mat_size = 8;
y = 1:1:mat_size*mat_size;
y = reshape(y, mat_size, mat_size);
y = y';
disp(y);

idx = zig_zag(mat_size);
disp(y(idx))