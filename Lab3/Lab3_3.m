% ELEC342 LAB3, Question 3 


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
semilogx (w,mag_origAudio_fft);
xlim([20,20000])
title('Original Signal in Frequency Domain')
xlabel('Frequency (Hz)')
ylabel('Magnitude')

subplot(3,2,4)
semilogx(w,mag_distAudio_fft);
xlim([20,20000])
title('Distorted Signal in Frequency Domain')
xlabel('Frequency (Hz)')
ylabel('Magnitude')


%recovering original audio by subtracting difference between the distorted
%audio and the original from the distorted signal in the frequency domain
recovAudio_fft = [0:L - 1];
for k = 1:L
    recovAudio_fft(k) = distAudio_fft(k) - (distAudio_fft(k)-origAudio_fft(k));
end

mag_recovAudio_fft = abs(recovAudio_fft);

%performing inverse fast fourier transform on recovered signal to bring it
%back into the time domain
recovAudio = ifft(recovAudio_fft);

%plotting recovered signal in both time and frequency domains
subplot(3,2,5)
stem(timeOrig,recovAudio);
title('Recovered Signal in Time Domain')
xlabel('Time (s)')
ylabel('Amplitude')

subplot(3,2,6)
semilogx(w,mag_recovAudio_fft);
xlim([20,20000])
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
