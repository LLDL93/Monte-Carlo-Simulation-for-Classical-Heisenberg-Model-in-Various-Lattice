function res = H(delta_theta,delta_phi)
global  N A

res = 0;
tmp = 0;

for ii = 1:N
    res = res + exchange_energy(ii,delta_theta(ii),delta_phi(ii),delta_theta,delta_phi);
    tmp = tmp - A*s_z(delta_theta(ii),delta_phi(ii))^2;
end

res = res/2 + tmp;
