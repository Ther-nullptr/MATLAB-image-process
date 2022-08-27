function [correct_ratio] = calculate_correct_ratio(hidden_info, hidden_info_decode)
    hidden_info = hidden_info(:);
    hidden_info_decode = hidden_info_decode(:);
    correct_num = sum(~xor(hidden_info, hidden_info_decode),'all');
    correct_ratio = correct_num/ length(hidden_info);
end

