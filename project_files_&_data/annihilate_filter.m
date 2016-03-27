function h = annihilate_filter(tau, K)
% Program that, given a signal tau, find its annihinating filter h

N = length(tau);
t1 = toeplitz(tau(K:N-1), tau(K:-1:1));
t2 = tau(K+1:N);
h = [1; t1\(-1*t2)];

end