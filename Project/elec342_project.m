clc;
clear;

[y,Fs] = audioread("speech.wav", [1,480000]);
time = [0:1/Fs:(length(y)-1)/Fs];

%adding noise to original signal
y_0_1 = awgn(y, 50, 0.1); %0.1 dB
y_0_5 = awgn(y, 50, 0.5); %0.5 dB
y_1 = awgn(y, 50, 1);     %1 dB
y_2 = awgn(y, 50, 2);     %2 dB


%creating and applying butterworth filter to noisy signal
[b,a] = butter(4, 2000/(Fs/2),'low'); %lowpass, 4th order, Cutoff freq: 2000 Hz
filter_tf = tf(b,a);
y_2_filt = filter(b,a,y_2);


exit = false;
while(exit == false)
    prompt = ('\n To hear 5 second snippets of audio:\n   [1] Original \n   [2] Noisy (snr = 50, 2 dB awgn) \n   [3] Filtered (4th order lowpass Butterworth w/ Wc=2Khz) (snr = 50, 2 dB awgn)\n\n To see Mean Squared Errors: \n   [4] MSEs for (0.1 dB, 0.5 dB, 1 dB, 2 dB) noise power levels and 2 dB filtered signal \n\n To see filter transfer function:\n   [5] Lowpass Butterworth 4th order \n\n To see waveforms: \n   [6] 2 dB plots \n\n [7] exit \n');
    disp('What would you like to do?')
    selection = input(prompt)
    
    switch selection
        case 1
            sound(cutToFiveSec(y), Fs)
        case 2
            sound(cutToFiveSec(y_2), Fs)
        case 3
            sound(cutToFiveSec(y_2_filt), Fs)
        case 4
            %calculating Mean Square Error between original and distorted signals

            disp('MSE between original and noisy signals (Additive White Gaussian Noise)')

            disp('MSE(SNR = 50, Power = 0.1 dB)')
            getMSE(y, y_0_1);

            disp('MSE(SNR = 50, Power = 0.5 dB)')
            getMSE(y, y_0_5);

            disp('MSE(SNR = 50, Power = 1 dB)')
            getMSE(y, y_1);

            disp('MSE(SNR = 50, Power = 2 dB)')
            getMSE(y, y_2);
            
            %calculating MSE between original signal and filtered noisy signal
            disp('MSE between original and filtered 2 dB noisy signal (Additive White Gaussian Noise)')
            
            disp('MSE of filtered signal with lowpass 4th order Butterworth (SNR = 50, Power = 2 dB)')
            getMSE(y,y_2_filt);
        case 5
            filter_tf
        case 6
            subplot(3,1,1)
            plot(time,y)
            title('Waveform of Original Signal in Time (s)')
            xlabel(' Time (s) ')
            ylabel(' y(t) ')

            subplot(3,1,2)
            plot(time,y_2)
            title('Waveform of Noisy Signal (awgn, snr = 50, pow = 2 dB) in Time (s)')
            xlabel(' Time (s) ')
            ylabel(' y(t) ')
            
            %plotting filtered signal
            subplot(3,1,3)
            plot(time,y_2_filt)
            title('Waveform of filtered Noisy Signal (awgn, snr = 50, pow = 2 dB) in Time (s) using 4th order lowpass Butterworth filter (Cutoff: 2000Hz)')
            xlabel(' Time (s) ')
            ylabel(' y(t) ')
        case 7
            exit = true;
            disp('Program Exited')
    end
end

    
    
    
    
    
    
    
    