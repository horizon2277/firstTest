function [y,h] = CHANNEL_ESTIMATE_rician(x,SNR_dB,K)

%acqurie noise according to SNR and x
n = length(x);
SNR_linear = 10^(SNR_dB / 10);
noise_power = var(x) / SNR_linear;
noise = sqrt(noise_power / 2) * (randn(n, 1) + 1j * randn(n, 1));

%generate h and calculate y 
h0 = sqrt(0.5)*(randn(1,n)+1j*randn(1,n));
h = sqrt(K/(K+1)) + sqrt(1/(K+1))*h0;%for K:0->rayleigh;1~5->rician;∞->awgn
y = h.' .*x + noise;%rician: Los + NLos + noise

end
