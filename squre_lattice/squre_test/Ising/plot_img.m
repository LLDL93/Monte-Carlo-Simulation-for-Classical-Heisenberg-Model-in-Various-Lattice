clc
close all

L = 20;
N = L^2;

T = dlmread('T.txt');
C_v = dlmread('C_v.txt');
C_v = C_v/N;
%X = dlmread('X.txt');
E = dlmread('E.txt');
Mag = dlmread('Mag.txt');
Mag = abs(Mag);

figure
plot(T,E,'o-')
%axis([0,max(T),0,max(E)])

figure
plot(T,C_v,'o-')

figure
plot(T,Mag,'o-')