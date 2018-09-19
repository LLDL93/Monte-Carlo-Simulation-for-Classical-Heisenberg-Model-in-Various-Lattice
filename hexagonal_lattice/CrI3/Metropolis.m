function [res_theta,res_phi] = Metropolis(delta_theta,delta_phi,T)

res_theta = delta_theta;
res_phi = delta_phi;

%%{
for ii = 1:length(delta_theta)
rnd_theta = acos(1-2*unifrnd(0,1,1,1));     %Exn 16.24, p. 399 Newman and Barkema
rnd_phi = unifrnd(0,1,1,1)*2*pi;


delta_E = nearest_energy(ii,rnd_theta,rnd_phi,res_theta,res_phi)- ... 
    nearest_energy(ii,res_theta(ii),res_phi(ii),res_theta,res_phi);

            if delta_E < 0 
                res_theta(ii) = rnd_theta;
                res_phi(ii) = rnd_phi;
            elseif unifrnd(0,1,1,1)< exp(-delta_E/T)
                res_theta(ii) = rnd_theta;
                res_phi(ii) = rnd_phi;
            end
end
%}







