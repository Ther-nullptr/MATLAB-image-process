function [idx] = zig_zag(mat_size)
    idx = [];
    y = reshape(1:mat_size*mat_size, mat_size, mat_size);
    
    for i = 2:2*mat_size
        for j = max(i - mat_size, 1):min(mat_size, i-1)
            if mod(i, 2) == 0
               idx = [idx, y(i-j, j)];
            else
               idx = [idx, y(j, i-j)];
            end
        end
    end
    
end

