idx = 1;

for l = 3:5
    for block_size = 10:10:20
        for threshold = 0.8:0.1:0.9
            % get the feature
            ref_destiny = extract_face_feature(l);

            % split the picture
            P = imread('data/test_3.bmp');

            subplot(3,4,idx);
            imshow(P);

            % block
            [h, w, c] = size(P);
            block_h = floor(h/block_size);
            block_w = floor(w/block_size);
            title(strcat('threshold=',num2str(threshold), ' l=', num2str(l), ' block-size=', num2str(block_size)));

            for i = 0:block_h-1
                for j = 0:block_w-1
                    block = P(block_size * i + 1: block_size * (i + 1),block_size * j + 1:block_size * (j + 1),:); % get the block
                    hypo_destiny = get_probability_density(block, l);
                    if(1 - sum(sqrt(hypo_destiny).*sqrt(ref_destiny)) < threshold)
                        rectangle('position',[block_size*j + 1,block_size*i + 1,block_size,block_size],'EdgeColor','r');
                    end
                end
            end
            idx = idx + 1;
        end
    end
end
