function [y,h] = CHANNEL_ESTIMATE_awgn(x,SNR_dB)

%generate h and calculate y 
h = ones(1,n);
y = awgn(x,SNR_dB);%awgn: Los + noise

end
