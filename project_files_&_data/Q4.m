% Q1

n_samp = 2048;
T = 64;
K = 2;

% orig_t_k = floor(rand([2,1])*n_samp/T)*T;
% orig_a_k = floor(rand([2,1])*10);

%% Stream of Diracs
x = zeros(1,n_samp);
x(orig_t_k) = orig_a_k;
% figure
% stem(x);
% title('Orginal Stream of Diracs with K = 2');


%% Daubechies scaling function
phi = zeros(1,n_samp);
[phi_T, psi_T, xval] = wavefun('dB4',6);
phi(1:length(phi_T)) = phi_T;

%% Sampling kernel
y = x' .* phi';
y = y(1:T:n_samp);

s = C * y;
