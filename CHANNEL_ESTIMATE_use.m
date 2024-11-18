%test the function -- CHANNEL_ESTIMATE



% initialize parameters
SNR_dB = 20;
numSNR = length(SNR_dB);
K = 4;
type_channel = 'CHANNEL_ESTIMATE_rician';
type_estimate = 'CHANNEL_ESTIMATE_MMSE';
indicators_plot = 1;

Nr = 100;
Nt = 80;


%use the function:CHANNEL_ESTIMATE
[h_outcome,h_error,SNR_dB,struct] = CHANNEL_ESTIMATE(Nr,Nt,SNR_dB,K,type_channel,type_estimate,indicators_plot,struct);