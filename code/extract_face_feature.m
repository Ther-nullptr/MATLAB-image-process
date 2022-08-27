function [destiny_list] = extract_face_feature(l)
    destiny_list = zeros(1, 2^(3 * l));
    for i = 1:33
        picture = imread(strcat('data/Faces/', num2str(i), '.bmp'));
        destiny_list_single = get_probability_density(picture, l);
        destiny_list = destiny_list + destiny_list_single;
    end
    destiny_list = destiny_list/33;
end

