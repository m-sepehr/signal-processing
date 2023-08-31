% ELEC342 LAB4, Question 1 (d)


clc;
clear;

Fs = 12000;

t = [0:1/Fs:1];

x = sin(100*t) + sin(2000*t) + sin(6000*t);

Wc1 = (1950/(2*pi))/(Fs/2);
Wc2 = (2050/(2*pi))/(Fs/2);


[b,a] = butter(4, [Wc1 Wc2], 'bandpass');
[d,c] = cheby1(4, 1, [Wc1 Wc2], 'bandpass');
[f,e] = ellip(4, 1, 60, [Wc1 Wc2], 'bandpass');
gb = tf(b,a);
gc = tf(d,c);
ge = tf(f,e);

x_butter = filter(b,a,x);
x_cheby1 = filter(d,c,x);
x_ellip = filter(f,e,x);

subplot (4,1,1)
plot(abs(fft(x)));
title(' fft of x(t) ');

subplot (4,1,2)
plot(abs(fft(x_butter)));
title(' fft of filtered x(t) around 2000Hz using 8th order Butterworth Bandpass ')

subplot (4,1,3)
plot(abs(fft(x_cheby1)));
title(' fft of filtered x(t) around 2000Hz using 8th order Chebyshev I Bandpass ')

subplot (4,1,4)
plot(abs(fft(x_ellip)));
title(' fft of filtered x(t) around 2000Hz using 8th order Elliptic Bandpass ')
