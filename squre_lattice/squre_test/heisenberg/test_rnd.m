clc
clear all
close all

global M

M = 1;
N = 30000;

rnd_theta = acos(1-2*unifrnd(0,1,1,N));
%rnd_theta = unifrnd(0,1,1,N)*pi;
rnd_phi = unifrnd(0,1,1,N)*2*pi;


hold on
axis equal
%axis off

%%{
for ii = 1:N
   plot3(s_x(rnd_theta(ii),rnd_phi(ii)),s_y(rnd_theta(ii),rnd_phi(ii)), ... 
       s_z(rnd_theta(ii),rnd_phi(ii)),'o','MarkerSize',2, ...
       'MarkerEdgeColor','k', 'MarkerFaceColor','k')
      
    
end
%}

xlabel('x');
ylabel('y');
zlabel('z');






