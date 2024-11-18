%explanation of this function:
%This function is used to execute channel estimation and return the value of h.
%Additionally, the user can choose whether plot the indicators of the effect of the estimation or not.

%explanation of these inputs:
%1.Nr
%2.Nt   Both Nr and Nt are used to generate appropriate pilots.
%3.SNR_dB: to define the strength of the noise
%4.K: a parameter for the rician channel, which means the ratio of the power of Los and NLos
%5.type_channel: determine the kind of the channel
%6.type_estimate: determine the method of executing channel estimating
%7.indicators_plot: determine whether the indicators of the effect of the estimation will be plotted or not 
%8.struct: a struct used to store the error of h and its corresponding SNR

function [h_outcome,h_error,SNR_dB,struct] = CHANNEL_ESTIMATE(Nr,Nt,SNR_dB,K,type_channel,type_estimate,indicators_plot,struct)
    
    %run 20 time to decrease the error
    runs = 20;
    for t = 1:runs
        %generate the pilots:x in the first time
        for k = 1:Nt
            N = Nr;
            m = 1:N;
            M1 = 1;
            x = exp((1j * pi * M1 * m.^2) / N).';
            pilots(:,k,t)= x;
        end
        
        for i = 1:Nt    
            %process the signal and estimate the channel
            h = feval(type_channel,pilots(:,i,t),K);%function1
            y(:,i,t) = CHANNEL_ESTIMATE_acquire_n_and_y(pilots(:,i,t),h,SNR_dB);%function2
            h_est(:,i,t) = feval(type_estimate,y(:,i,t),pilots(:,i,t),SNR_dB);%function3            
            %calculate the indicators of the estimation
            [distance(:,i,t),h_magnitude(:,i,t),h_phase(:,i,t),h_est_magnitude(:,i,t),h_est_phase(:,i,t),mean_distance(i,t)] = CHANNEL_ESTIMATE_indicator_calculation(h_est(:,i,t),h);%function4
        
        end    
    end
    
    h_outcome = mean(h_est,3);    
    h_error = mean(distance,3);
    
    %store new h_error and SNR_dB in the struct
    t = length(struct);
    struct(t+1).error = h_error;
    struct(t+1).SNR = SNR_dB;

    
    if indicators_plot == 1
        %figure the indicators
        CHANNEL_ESTIMATE_figure_indicators(h_error,Nr,Nt);%function5
    end
end
