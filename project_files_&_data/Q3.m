load('tau.mat');
tau = tau';

n_samp = 2048;
T = 64;
K = 2;

% find annihilating filter
h = annihilate_filter(tau, K);

% find locations t_k
t_k = roots(h);
n_k = round(t_k*T);

% find amplitude a_k
vand = fliplr(vander(t_k))';
a_k = vand\tau(1:K,:);

x = zeros(1,n_samp);
for i=1:length(t_k)
    x(n_k(i)) = a_k(i);
end
figure
stem(x);
