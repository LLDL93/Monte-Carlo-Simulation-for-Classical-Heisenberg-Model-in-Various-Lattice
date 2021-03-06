function [res_theta,res_phi] = Metropolis(delta_theta,delta_phi,T)

res_theta = delta_theta;
res_phi = delta_phi;

%%{
for ii = 1:length(delta_theta)

        rnd_num = fix(unifrnd(0,1,1,1)*4)+1;
        rnd_phi = 0;
        if rnd_num == 1
           rnd_theta = acos(3/3);
        end
        if rnd_num == 2
            rnd_theta = acos(1/3);
        end
        if rnd_num == 3
            rnd_theta = acos(-1/3);
        end
        if rnd_num == 4
            rnd_theta = acos(-3/3);
        end




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







