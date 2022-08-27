function [ratio] = calculate_compress_ratio(stream_name)
    load(stream_name);
    ratio = h*w / ((length(dc_code) + length(ac_code))/8);
end

