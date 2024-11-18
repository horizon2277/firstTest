%explanation of this function:
%This function is used to execute channel estimation and return the value of h.
%Additionally, the user can choose whether plot the indicators of the effect of the estimation or not.

%explanation of these inputs:
%1.pilots: pilot signals used to execute channel estimation
%2.SNR_dB: simulate environments with different strengths of noise
%3.K: a parameter for the rician channel, which means the ratio of the power of Los and NLos
%4.type_channel: determine the kind of the channel
%5.type_estimate: determine the method of executing channel estimating
%6.indicators_plot: determine whether the indicators of the effect of the estimation will be plotted or not 

function [h_outcome,h_est] = main_function0(pilots,SNR_dB,K,type_channel,type_estimate,indicators_plot)

%execute the estimation in differents conditions of SNR
for i = 1:length(SNR_dB)

    %process the signal and estimate the channel
    [y(:,i),h] = feval(type_channel,pilots,SNR_dB(i),K);%function1
    h_est(:,i) = feval(type_estimate,y(:,i),pilots,SNR_dB(i));%function2
    
    %calculate the indicators of the estimation
    [distance(:,i),h_magnitude(:,i),h_phase(:,i),h_est_magnitude(:,i),h_est_phase(:,i),mean_distance(i)] = CHANNEL_ESTIMATE_indicator_calculation(h_est(:,i),h);%function3

end

%use the mean of h_est to be the final outcome of the channel estimation
h_outcome = mean(h_est,1);

if indicators_plot == 1
    %figure the indicators
    figure_function0(mean_distance,h_magnitude,h_phase,h_est_magnitude,h_est_phase,SNR_dB)%function4
end

end