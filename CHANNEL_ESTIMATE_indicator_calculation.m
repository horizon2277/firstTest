function [distance,h_magnitude,h_phase,h_est_magnitude,h_est_phase,mean_distance] = CHANNEL_ESTIMATE_indicator_calculation(h_est,h)

    %calculate the indicators to be used to show the effect of the channel
    %estimation
    real_diff = real(h_est).'- real(h);
    imag_diff = imag(h_est).'- imag(h);
    mean_distance = mean(sqrt(real_diff.^2 + imag_diff.^2));
    distance = sqrt(real_diff.^2 + imag_diff.^2);
    
    h_magnitude = abs(h)';
    h_phase = angle(h)';
    h_est_magnitude = abs(h_est);
    h_est_phase = angle(h_est);
end