function y = test_CHANNEL_ESTIMATE_acquire_n_and_y(x,h,SNR_dB)
%get the length of x
n = length(x);

%acqurie noise according to x and h
SNR_linear = 10^(SNR_dB / 10);
noise_power = var(x) / SNR_linear;
noise = sqrt(noise_power / 2) * (randn(n, 1) + 1j * randn(n, 1));

%calculate y
y = h.' .*x + noise;%awgn: Los + noise;rayleigh: NLos + noise;rician: Los + NLos + noise

end
