function h = CHANNEL_ESTIMATE_rayleigh(x,K)
%get the length of x
n = length(x);

%generate h
h = sqrt(0.5)*(randn(1,n)+1j*randn(1,n));%rayleigh: NLos + noise

end