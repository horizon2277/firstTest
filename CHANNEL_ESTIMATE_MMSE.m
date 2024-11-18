function h_est = CHANNEL_ESTIMATE_MMSE(y,x,SNR_dB)

%acqurie noise according to SNR and x
n = length(x);
SNR_linear = 10^(SNR_dB / 10);
noise_power = var(x) / SNR_linear;

%calculate h_est
h_ls = y./x;
R_hh = h_ls * h_ls';
R_nn = noise_power * eye(n);%var(x) = 1
W_mmse = R_hh / (R_hh + R_nn);
h_est = W_mmse * h_ls;

end