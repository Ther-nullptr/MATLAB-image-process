l = 4;
block_size = 10;
threshold = 0.6;

% get the feature
ref_destiny = extract_face_feature(l);

pic = imread('data/test_3.bmp');

% detect the face
get_face_area(pic, ref_destiny, l, threshold, block_size);

idx = 0;

