function [val] = concact_rgb(r, g, b, l)    
    ignore_bits = 8 - l;
    r = uint32(bitshift(r, -ignore_bits, 'uint8'));
    g = uint32(bitshift(g, -ignore_bits, 'uint8'));
    b = uint32(bitshift(b, -ignore_bits, 'uint8'));
    val = bitshift(r, l*2, 'uint32') + bitshift(g, l, 'uint32') + b;
end

