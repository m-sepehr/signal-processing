% ELEC342 LAB4, Question 1 (c)


clc;
clear;

Fs = 12000;

t = [0:1/Fs:1];

x = sin(100*t) + sin(2000*t) + sin(6000*t);

Wc1 = (1950/(2*pi))/(Fs/2);
Wc2 = (2050/(2*pi))/(Fs/2);

%Elliptic filter Rp = 1 dB, Rs = 60dB
[b,a] = ellip(2, 1, 60, [Wc1 Wc2], 'bandpass'); %Bandpass has order 2n
[d,c] = ellip(4, 1, 60, [Wc1 Wc2], 'bandpass');
g4 = tf(b,a);
g8 = tf(d,c);

subplot(3,2,1)
plot(x);
title(' x(t) ')

subplot(3,2,4)
bode(g4, {0,3000}); grid;

x_filt4 = filter(b,a,x);

subplot(3,2,3)
plot(x_filt4);
title(' x(t) filtered around 2000Hz using 4th order Elliptic Bandpass ')


subplot(3,2,6)
bode(g8, {0,3000}); grid;

x_filt8 = filter(d,c,x);

subplot(3,2,5)
plot(x_filt8);
title(' x(t) filtered around 2000Hz using 8th order Elliptic Bandpass ')
