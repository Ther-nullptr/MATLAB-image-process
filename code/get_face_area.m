function [] = get_face_area(P, ref_destiny, l, threshold, block_size)
    % get the feature
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
end

