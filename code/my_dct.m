function [C] = my_dct(P)
    [h, w] = size(P);
    D_1 = zeros(h,h);
    D_1(1,:) = 0.5^0.5;
    disp(h);
    for i = 2:h
        D_1(i,:) = cos(pi*(i-1)*(1:2:(2*h-1))/(2*h));
    end
    D_1 = D_1 * (2/h) ^ 0.5;
    
    D_2 = zeros(w,w);
    D_2(1,:) = 0.5^0.5;
    for i = 2:w
        D_2(i,:) = cos(pi*(i-1)*(1:2:(2*w-1))/(2*w));
    end
    D_2 = D_2 * (2/w) ^ 0.5;
    
    C = D_1 * double(P) * D_2';
end

