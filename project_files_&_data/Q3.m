load('tau.mat');
tau = tau;
K = 2;

h = annihilate_filter(tau, K);
