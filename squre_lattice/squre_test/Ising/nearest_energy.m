function res = nearest_energy(ii,theta,phi,res_theta,res_phi)
global L J1 J2 A M  N

%S_x = s_x(theta,phi);
%S_y = s_y(theta,phi);
S_z = s_z(theta,phi);

%nearest neighbour
    a_1 = mod(ii-1+1,N)+1;
    a_2 = mod(ii-1-1,N)+1;
    a_3 = mod(ii-1-L,N)+1;
    a_4 = mod(ii-1+L,N)+1;

a = [a_1,a_2,a_3,a_4];


temp_1 = 0;

for ii = 1:4
    temp_1 = temp_1 + S_z*s_z(res_theta(a(ii)),res_phi(a(ii)));
end

res = -J1*temp_1;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    







