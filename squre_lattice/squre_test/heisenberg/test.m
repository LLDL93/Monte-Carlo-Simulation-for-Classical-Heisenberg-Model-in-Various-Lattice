clear all
clc
close all

global L J1 J2 A M N
M = 1; 
L = 20;
N = L^2;
warmup = 1e4;
updates = 2e4;

delta_theta =  ones(1,N)*0;
delta_phi = ones(1,N)*0;

%J1 = 5.38e-3*1.602e-19/1.381e-23;          %exchange coefficient J/k_b. nearest neighbour
J1 = 1;
%J2 = 6.7e-3*1.602e-19/1.381e-23;    %next nearest neighbour
J2 = 0;
%A = 0.14e-3*1.602e-19/1.381e-23;    %Magnetocrystalline Anisotropy Energy
A = 0;

delta_theta(2) = pi/2;

ii = 2;
nearest_energy(ii,delta_theta(ii),delta_phi(ii),delta_theta,delta_phi)