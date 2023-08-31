% ELEC342 LAB4, Question 3


clc;
clear;

[y,Fs] = audioread('ELEC_364_lab_5_Audio_S.wav');
simulationTime = 7.43; % Specify the simulation time in seconds
simOut = sim('model.slx', 'StopTime', num2str(simulationTime));
outputArray = simOut.get('simout').Data;
outputArray = reshape(outputArray, [], 1);

for index = 1:44101
    original_sound(index) = y(index);
end

subplot(4,1,1)
plot(original_sound)
title(' The first second of the Original sound ')

subplot(4,1,2)
plot(fftshift(abs(fft(original_sound))));
title(' FFT of the Original sound ');

subplot(4,1,3)
plot(outputArray)
title(' The first second of the sampled sound ')

subplot(4,1,4)
plot(fftshift(abs(fft(outputArray))));
title(' FFT of the sampled sound ');

