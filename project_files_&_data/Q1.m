n_samp = 2048;
T = 64;
d_max = 3;
t = 1:2048;

% scaling function
phi = zeros(1,n_samp);
[phi_T, psi_T, xval] = wavefun('dB4',6);
phi(1:length(phi_T)) = phi_T;

% figure
% plot(phi_T);


% phi shifted by n
C = zeros(4,32);
phi_shift = zeros(1,n_samp);
for m = 0:d_max
    L = m+1;
    figure
    for n = 0:(32-L)
        phi_shift_dual = zeros(1,n_samp);
        phi_shift_dual(:,(1+n*T):length(phi_T)+n*T) = fliplr(phi_T); % dual basis
        phi_shift_dual = phi_shift_dual(:,1:n_samp);
        
        C(m+1,n+1) = dot(t.^m, phi_shift_dual');
        
        phi_shift(:,(1+n*T):length(phi_T)+n*T) = C(m+1,n+1) * phi_T;
        hold on
        plot(phi_shift);
    end
%     plot(C(m+1,:));
    hold off
end

