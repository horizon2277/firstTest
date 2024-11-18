% a = 2*ones(11,10);
% for i = 1:10
%    struct(i).name = a(:,i);
%    struct(i).age = i;
% end
% 
% % c = [a(:,1),a(:,2),a(:,3),a(:,4),a(:,5),a(:,6),a(:,7),a(:,8),a(:,9),a(:,10)];
% % 
% % d = [[struct.name],ones(10,1)];%√
% 
% % e = length(struct);
% 
% 
% % error_SNR.error = [];
% % error_SNR.SNR = [];





%explanation of this function:
%This function is used to execute channel estimation and return the value of h.
%Additionally, the user can choose whether plot the indicators of the effect of the estimation or not.

%explanation of these inputs:
%1.pilots: pilot signals used to execute channel estimation
%2.SNR_dB: to define the strength of the noise
%3.K: a parameter for the rician channel, which means the ratio of the power of Los and NLos
%4.type_channel: determine the kind of the channel
%5.type_estimate: determine the method of executing channel estimating
%6.indicators_plot: determine whether the indicators of the effect of the estimation will be plotted or not 

function [h_outcome,h_error,SNR_dB,struct] = CHANNEL_ESTIMATE(pilots,SNR_dB,K,type_channel,type_estimate,indicators_plot,struct)
%generate the pilots:x in the first time
if (pilots == 0)
    for s = 1:Nt
        N = Nr;
        m = 1:N;
        M1 = 1;
        x = exp((1j * pi * M1 * m.^2) / N).';
        pilots(:,s) = x;
    end
end

%define the times the programme runs
runs = 20;

%execute the estimation in differents conditions of SNR
for i = 1:runs

    %process the signal and estimate the channel
    h = feval(type_channel,pilots,K);%function1
    y(:,i) = CHANNEL_ESTIMATE_acquire_n_and_y(pilots,h,SNR_dB);%function2
    h_est(:,i) = feval(type_estimate,y(:,i),pilots,SNR_dB);%function3
    
    %calculate the indicators of the estimation
    [distance(:,i),h_magnitude(:,i),h_phase(:,i),h_est_magnitude(:,i),h_est_phase(:,i),mean_distance(i)] = CHANNEL_ESTIMATE_indicator_calculation(h_est(:,i),h);%function4

end

%use the mean of h_est to be the final outcome of the channel estimation
h_outcome = mean(h_est,2);
h_error = mean(distance,2);

%store new h_error and SNR_dB in the struct
t = length(struct);
struct(t+1).error = h_error;
struct(t+1).SNR = SNR_dB;


if indicators_plot == 1
    %figure the indicators
    CHANNEL_ESTIMATE_figure_indicators(h_error);%function5
end

end
