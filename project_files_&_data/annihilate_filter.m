function h = annihilate_filter(tau, K)
% Program that, given a signal tau, find its annihinating filter h

t1 = toeplitz(tau(K:end-1), tau(K:-1:1));
t2 = tau(K+1:end);
h = [1; t1\(-1*t2')];

end