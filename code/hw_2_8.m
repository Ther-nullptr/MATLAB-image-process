load('data/hall.mat');
load('data/JpegCoeff');
P = double(hall_gray);

% fill the picture to block it
[h, w] = size(P);
disp([h w]);
if(mod(h, 8) ~=0)
    P(h+1:(floor(h/8)+1)*8,:) = 0;
end
if(mod(w, 8) ~=0)
    P(:,w+1:(floor(w/8)+1)*8) = 0;
end

% block
[h, w] = size(P);
block_h = h/8;
block_w = w/8;
k = 1;
result = [];
for i = 0:block_h-1
    for j = 0:block_w-1
        block = P(8*i + 1: 8*(i+1),8*j+1:8*(j+1)) - 128; % get the block
        D_block = dct2(block);
        D_block = round(D_block./QTAB); % quantation
        zigzag_D_idx = zig_zag(8);
        result(:,k) = D_block(zigzag_D_idx); % zigzag
        k = k + 1;
    end
end

