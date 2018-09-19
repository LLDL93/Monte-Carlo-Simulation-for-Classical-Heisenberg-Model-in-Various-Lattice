clc
close all

T = dlmread('T.txt');
C_v = dlmread('C_v.txt');
%X = dlmread('X.txt');
E = dlmread('E.txt');
Mag = dlmread('Mag.txt');

figure
plot(T,E,'o-')
%axis([0,max(T),0,max(E)])

figure
plot(T,C_v,'o-')

figure
plot(T,Mag,'o-')