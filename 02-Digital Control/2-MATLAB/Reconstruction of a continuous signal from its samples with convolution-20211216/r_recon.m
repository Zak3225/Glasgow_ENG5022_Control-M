function out = r_recon(t, r_kT, k1, k2, T)
% Uses the convolution formula to reconstruct a continuous signal from a
% finite subset of its samples, from k1 to k2.

out = 0;
for k = k1:k2
    out = out + r_kT(k)*sin(pi*(t-k*T)/T) / (pi*(t-k*T)/T);
end