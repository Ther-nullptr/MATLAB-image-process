load('data/hall.mat')
hall_with_circle = hall_color;
hall_with_chessboard = hall_color;
subplot(2,1,1);
imshow(hall_with_circle);

% get size
[height, width, ~] = size(hall_color);
r = min(height, width)/2;
hold on;

% draw circle
rectangle('position',[width/2-r,height/2-r,2*r,2*r],'curvature',[1,1],'EdgeColor','r');

% draw chess board
subplot(2,1,2);
block_width = 8;
height_blocks = height/block_width;
width_blocks = width/block_width;
for i = 1:height
    for j = 1:width
        if (xor(mod(floor(i/block_width), 2), mod(floor(j/block_width),2) == 1))
            for k = 1:3
                hall_with_chessboard(i,j,k) = 0;
            end
        end
    end
end
imshow(hall_with_chessboard);