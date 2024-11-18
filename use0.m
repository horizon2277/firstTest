%test the function -- CE_performance_display



% initialize parameters
N = 100;
SNR_dB = -5:5:25;
numSNR = length(SNR_dB);
K = 4;
type_channel = 'CHANNEL_ESTIMATE_rician';
type_estimate = 'CHANNEL_ESTIMATE_MMSE';
indicators_plot = 1;

% generate the pilots:x
m = 1:N;
M1 = 1;
x = exp((1j * pi * M1 * m.^2) / N).';
pilots = x;
x_power = var(x);


[h_outcome,h_est] = main_function0(pilots,SNR_dB,K,type_channel,type_estimate,indicators_plot);

% disp(h_outcome);