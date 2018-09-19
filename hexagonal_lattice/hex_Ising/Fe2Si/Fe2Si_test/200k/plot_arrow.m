clc
close all

L = 60;
%delta_theta =  unifrnd(0,1,1,2*L^2)*pi;
%delta_phi = unifrnd(0,1,1,2*L^2)*2*pi;
delta_theta = dlmread('delta_theta.txt');
delta_phi = dlmread('delta_phi.txt');

tri_x = ones(1,2*L^2)*0;
tri_y = ones(1,2*L^2)*0;

for ii = 1:2*L^2
    tri_x(ii) = fix((mod(ii-1,2*L)+1+1)/2);
    tri_y(ii) = fix((ii-1)/2/L)+1;
end

for ii = 1:2*L^2
    if mod(ii,2) == 1
    tri_x(ii) = (tri_x(ii)-1)+1/3;
    tri_y(ii) = (tri_y(ii)-1)+1/3;
    else
            tri_x(ii) =(tri_x(ii)-1)+2/3;
            tri_y(ii) = (tri_y(ii)-1)+2/3;
    end
end

x_y = [tri_x;tri_y];
coordi = [tri_x;tri_y]*0;

for ii = 1:2*L^2
    tmp = tri_x(ii)*[1;0] + tri_y(ii)*[1/2;sqrt(3)/2];
    coordi(1,ii) = tmp(1);
    coordi(2,ii) = tmp(2);   
end


hold on
axis equal
%plot(tri_x,tri_y,'.')
%plot(coordi(1,:),coordi(2,:),'ko','MarkerSize',15)
%{
for ii=1:L^2
     text(coordi(1,ii)+0.01,coordi(2,ii)+0.01,num2str(ii))
end
%}

%%{
r = 0.3;
hold on
axis equal
axis off
for ii = 1:2*L^2
   plot(coordi(1,ii),coordi(2,ii),'o','MarkerSize',15, ...
       'MarkerEdgeColor','k', ... 
       'MarkerFaceColor',([r*cos(delta_theta(ii)),r*cos(delta_theta(ii)),r*cos(delta_theta(ii))]+1)/2)

   quiver(coordi(1,ii),coordi(2,ii), ... 
       r*cos(delta_phi(ii)), ... 
       r*sin(delta_phi(ii)),'b','LineWidth',2,'MaxHeadSize',1)
      
end
%}








