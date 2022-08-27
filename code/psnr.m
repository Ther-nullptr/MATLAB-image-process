function [result] = psnr(bmp, jpeg, h, w)
    mse = sum((double(jpeg) - double(bmp)).^2, 'all')/(h*w);
    result = 10*log10(255*255/mse);
end

