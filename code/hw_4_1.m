picture = imread('data/Faces/1.bmp');
subplot(4,1,1);
imshow('data/Faces/1.bmp');

for l = 3:5
    probability_density = get_probability_density(uint8(picture),l);
    idx = 1:length(probability_density);
    subplot(4,1,(l-1));
    plot(idx, probability_density);
end