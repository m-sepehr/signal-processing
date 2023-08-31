% ELEC342 LAB4, Question 2 (part a)


clc;
clear;

Fs = 8192;

t = [0:1/Fs:3];

tone1 = sin(200*2*pi*t);
tone2 = sin(330*2*pi*t);
tone3 = sin(480*2*pi*t);

for index1 = 1:(1/3)*length(t)
    tone2(index1) = 0;
end

for index2 = 1:(2/3)*length(t)
    tone3(index2) = 0;
end

combined_signal = tone1 + tone2+ tone3;

subplot(2,1,1);
plot(combined_signal);
title(' Combined Signal in Time Domain ')

subplot(2,1,2);
plot(abs(fft(combined_signal)));
title(' FFT of Combined Signal in Frequency Domain ');

soundsc(combined_signal, Fs);

