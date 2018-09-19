function res = nearest_energy(ii,theta,phi,res_theta,res_phi)
global L J1 J2 A 

S_x = s_x(theta,phi);
S_y = s_y(theta,phi);
S_z = s_z(theta,phi);

%nearest neighbour
if mod(ii,2) == 0
    a_1 = mod(ii-1+1,2*L^2)+1;
    a_2 = mod(ii-1-1,2*L^2)+1;
    a_3 = mod(ii-1-2*L+1,2*L^2)+1;
else
    a_1 = mod(ii-1+1,2*L^2)+1;
    a_2 = mod(ii-1-1,2*L^2)+1;
    a_3 = mod(ii-1+2*L-1,2*L^2)+1;
end

a = [a_1,a_2,a_3];


temp_1 = 0;

for ii = 1:3
    temp_1 = temp_1 + S_x*s_x(res_theta(a(ii)),res_phi(a(ii))) ... 
        + S_y*s_y(res_theta(a(ii)),res_phi(a(ii))) ... 
        + S_z*s_z(res_theta(a(ii)),res_phi(a(ii)));
end

res = -J1*temp_1-A*S_z^2;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    







