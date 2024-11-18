function [y,h] = CHANNEL_ESTIMATE_rayleigh(x,SNR_dB)

%acqurie noise according to SNR and x
n = length(x);
SNR_linear = 10^(SNR_dB / 10);
noise_power = var(x) / SNR_linear;
noise = sqrt(noise_power / 2) * (randn(n, 1) + 1j * randn(n, 1));

%generate h and calculate y 
h = sqrt(0.5)*(randn(1,n)+1j*randn(1,n));
y = h.' .*x + noise;%rayleigh: NLos + noise

end