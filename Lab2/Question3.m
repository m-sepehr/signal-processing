% ELEC342 LAB2, Part I Question 3


clc;
clear;

n = [1:21];
w = [0:0.2992:2*pi]

x = zeros(1,21)
x(9:13) = 1;

x_fft = fft(x);

x_ifft = ifft(x_fft);
mag_of_x_ifft = abs(x_ifft);

subplot(1,2,1)
stem(n,x)
xlabel(' n ')
ylabel(' x[n] ')
title (' input x[n] ')

subplot(1,2,2)
stem(n,mag_of_x_ifft)
xlabel(' n ')
ylabel(' x[n] ')
title(' x[n] obtained by ifft ')
