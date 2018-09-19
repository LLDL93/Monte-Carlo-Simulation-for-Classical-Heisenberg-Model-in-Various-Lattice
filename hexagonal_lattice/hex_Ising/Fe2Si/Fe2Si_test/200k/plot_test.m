clc
close all

L = 60;
N = 2*L^2;
warmup = 5e3;
updates = 5e3;

Mtest = dlmread('Mtest.txt');
Etest = dlmread('Etest.txt');

start = 1;

figure
plot(start:updates,Mtest(start:updates));

figure
plot(start:updates,Etest(start:updates));