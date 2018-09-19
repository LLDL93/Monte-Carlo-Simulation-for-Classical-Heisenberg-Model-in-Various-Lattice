%This programm simulate the Heisenberg model of hexagnal lattice
%consider the Magnetocrystalline Anisotropy Energy
%without external magnetic field
%periodic boundary condition deal with helical boundary codition
%ref: 1. M.E.J. Newman Monte Carlo Mtheods in Statistical Physics
%ref: 2 http://pubs.rsc.org/en/Content/ArticleLanding/2014/TC/C4TC01193G#!divAbstract
clear all
clc
close all

global L J1 J2 A M N
M = 1; 
L = 20;
N = L^2;
warmup = 1e4;
updates = 1.2e4;

delta_theta =  ones(1,N)*0;
delta_phi = ones(1,N)*0;

%J1 = 7.7e-3*1.602e-19/1.381e-23;          %exchange coefficient J/k_b. nearest neighbour
J1 = 1;
%J2 = 6.7e-3*1.602e-19/1.381e-23;    %next nearest neighbour
%J2 = 0;
%A = 0.35e-3*1.602e-19/1.381e-23;    %Magnetocrystalline Anisotropy Energy
A = 0;

T = linspace(0,3,101);
%T =0;
Mag = ones(1,length(T))*0;
E = ones(1,length(T))*0;
E_2 = ones(1,length(T))*0;

for jj = 1:length(T)
    %delta = ones(L,L)*M;
    
for ii = 1:updates
    [delta_theta,delta_phi] = Metropolis(delta_theta,delta_phi,T(jj));
    if ii>warmup
        
        %M_x = sum(M*sin(delta_theta).*cos(delta_phi))/N;
        %M_y = sum(M*sin(delta_theta).*sin(delta_phi))/N;
        M_z = sum(M*cos(delta_theta))/N;
        
        Mag(jj) = Mag(jj) + M_z;
        E(jj) = E(jj)+H(delta_theta,delta_phi);
        E_2(jj) = E_2(jj) + (H(delta_theta,delta_phi))^2;
        
    end
end
Mag(jj)=Mag(jj)/(updates-warmup);
E(jj) = E(jj)/(updates-warmup);
E_2(jj) = E_2(jj)/(updates-warmup);
%Mag_2(jj) = Mag_2(jj)/(updates-warmup);
jj
end

C_v = 1./T.^2 .* (E_2 - E.^2);

%X = 1./T.*(Mag_2-Mag.^2);

dlmwrite('C_v.txt', C_v, 'delimiter', '\t');
%dlmwrite('X.txt', X, 'delimiter', '\t');
dlmwrite('E.txt', E, 'delimiter', '\t');
dlmwrite('Mag.txt', Mag, 'delimiter', '\t');
dlmwrite('T.txt', T, 'delimiter', '\t');

dlmwrite('delta_theta.txt', delta_theta, 'delimiter', '\t');
dlmwrite('delta_phi.txt', delta_phi, 'delimiter', '\t');







