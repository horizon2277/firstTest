function h = CHANNEL_ESTIMATE_rician(x,K)
%get the length of x
n = length(x);

%generate h
h0 = sqrt(0.5)*(randn(1,n)+1j*randn(1,n));
h = sqrt(K/(K+1)) + sqrt(1/(K+1))*h0;%for K:0->rayleigh;1~5->rician;∞->awgn

end