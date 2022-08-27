function [D] = get_dct_params(dim)
    D = zeros(dim,dim);
    D(1,:) = 0.5^0.5;
    for i = 2:dim
        D(i,:) = cos(pi*(i-1)*(1:2:(2*dim-1))/(2*dim));
    end
    D = D * (2/dim) ^ 0.5;
end

