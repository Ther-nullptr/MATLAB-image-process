function [destiny_list] = get_probability_density(img, l)
    [h, w, c] = size(img);
    img = reshape(img, h*w, c);
    destiny_list = zeros(1, 2^(3 * l));
    for i = 1:h * w
        feature = concact_rgb(img(i, 1), img(i, 2), img(i, 3), l); 
        destiny_list(feature + 1) = destiny_list(feature + 1) + 1;
    end
    destiny_list = destiny_list/(h*w);
end 

