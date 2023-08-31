% ELEC342 LAB4, Question 2 (part b)


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


%removing 330Hz component from main signal
Wc1 = (280)/(Fs/2);
Wc2 = (380)/(Fs/2);

[b,a] = butter(5, [Wc1 Wc2], 'stop'); %bandpass has 2n order 
g = tf(b,a);

combined_signal_filt = filter(b,a,combined_signal);

subplot(3,2,1);
bode(g,{0,3000}); grid;

subplot(3,2,3);
plot(combined_signal)
title(' Combined Signal in Time Domain ')

subplot(3,2,4);
plot(combined_signal_filt)
title(' Combined Signal, 330Hz filtered out using 4th order Butterworth Bandstop ')

subplot(3,2,5)
plot(abs(fft(combined_signal)));
title(' FFT of Combined Signal ')

subplot(3,2,6)
plot(abs(fft(combined_signal_filt)));
title(' FFT of Combined Signal, 330Hz filtered out using 4th order Butterworth Bandstop ')

soundsc(combined_signal_filt, Fs);
