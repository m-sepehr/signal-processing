% ELEC342 LAB3, Question 3 notch filter


clc;
clear;

[origAudio, Fs] = audioread('Original.wav', [1,44100]);
%sound(origAudio,Fs)
timeOrig = [0:1/22050:2*Fs/22050 - 1/22050];
subplot(3,2,1)
stem(timeOrig,origAudio);
title('Original Signal in Time Domain')
xlabel('Time (s)')
ylabel('Amplitude')

[distAudio, Fs] = audioread('Distorted.wav', [1,44100]);
%sound(distAudio,Fs)
timeDist = [0:1/22050:2*Fs/22050 - 1/22050];
subplot(3,2,3)
stem(timeDist,distAudio);
title('Distorted Signal in Time Domain')
xlabel('Time (s)')
ylabel('Amplitude')

%calculating Mean Square Error between original and distorted signals

sum1 = 0;
L = 2*Fs;
for k = 1:L
    sum1 = sum1 + (origAudio(k) - distAudio(k))^2;
end

mse_orig_vs_dist = sum1/L

%using to DTFT to obtain signals in frequency domain
distAudio_fft = fft(distAudio);
origAudio_fft = fft(origAudio);
mag_distAudio_fft = abs(distAudio_fft);
mag_origAudio_fft = abs(origAudio_fft);

%plotting the signals in frequency domain
w = [0:0.5:44099/2];

subplot(3,2,2)
plot(w,mag_origAudio_fft);
title('Original Signal in Frequency Domain')
xlabel('Frequency (Hz)')
ylabel('Magnitude')

subplot(3,2,4)
plot(w,mag_distAudio_fft);
title('Distorted Signal in Frequency Domain')
xlabel('Frequency (Hz)')
ylabel('Magnitude')


%recovering original audio by using a notch filter
f0 = 11000;
Q = 1.4;
[b,a] = iirnotch(f0/(Fs/2),f0/(Fs/2)/Q);

recovAudio = filter(b,a,distAudio);
recovAudio_fft = fft(recovAudio);
mag_recovAudio_fft = abs(recovAudio_fft);

%plotting recovered signal in both time and frequency domains
subplot(3,2,5)
stem(timeOrig,recovAudio);
title('Recovered Signal in Time Domain')
xlabel('Time (s)')
ylabel('Amplitude')

subplot(3,2,6)
plot(w,mag_recovAudio_fft);
title('Recovered Signal in Frequency Domain')
xlabel('Frequency (Hz)')
ylabel('Magnitude')

sound(recovAudio,Fs)

%calculating Mean Squared Error between original signal and recovered
%signal in order to verify proper recovery

sum2 = 0;
L = 2*Fs;
for k = 1:L
    sum2 = sum2 + (origAudio(k) - recovAudio(k))^2;
end
mse_orig_vs_recov = sum2/L
