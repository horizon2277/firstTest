function CHANNEL_ESTIMATE_figure_indicators(h_error,Nr,Nt)
    figure;
    mesh(1:Nt,1:Nr, h_error);
    title('h_error');
    xlabel('Nt');ylabel('Nr');zlabel('h_error');
end