function [y] = inv_zig_zag(vec)
    mat_size = sqrt(length(vec));
    zig_zag_idx = zig_zag(mat_size);
    y = zeros(1, mat_size);
    for i = 1:mat_size * mat_size
        y(zig_zag_idx(i)) = vec(i);
    end
    y = reshape(y, mat_size, mat_size);
end

