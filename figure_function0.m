function figure_indicators_performance(mean_distance,h_magnitude,h_phase,h_est_magnitude,h_est_phase,SNR_dB)

    %综合估计效果
    figure;
    plot(SNR_dB, mean_distance, '-o');
    xlabel('SNR (dB)');
    ylabel('Mean Distance');
    title('估计值与真实值之间的平均距离');
    
    % 幅值比较
    figure;
    subplot(2,1,1);
    plot(SNR_dB, mean(h_magnitude, 1), '-o');
    hold on;
    plot(SNR_dB, mean(h_est_magnitude, 1), '-x');
    xlabel('SNR (dB)');
    ylabel('Magnitude');
    title('幅值比较');
    legend('真实幅值', '估计幅值');
    
    % 相位比较
    subplot(2,1,2);
    plot(SNR_dB, mean(h_phase, 1), '-o');
    hold on;
    plot(SNR_dB, mean(h_est_phase, 1), '-x');
    xlabel('SNR (dB)');
    ylabel('Phase (radians)');
    title('相位比较');
    legend('真实相位', '估计相位');

end