clc
close all

M = 3/2; 
L = 20;
N = 2*L^2;
warmup = 2e4;
updates = 2e4;

Mtest = dlmread('Mtest.txt');
Etest = dlmread('Etest.txt');

start = 1;

figure
plot(start:updates,Mtest(start:updates));

figure
plot(start:updates,Etest(start:updates));