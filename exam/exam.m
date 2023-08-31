clc;
clear;

%Highest angular frequency is 20pi. According to w = 2*pi*f,
%20pi rad/s is 10 Hz.
%Therefore Nyquist-rate should be 2 times the frequency so 20Hz.
prompt = ('Enter the sampling rate (true minimum is 20Hz): ');
Fs = input(prompt)
 
t = [0:1/Fs:3]

x = 2*cos(5*pi*t) - sin(20*pi*t);

subplot(3,1,1)
plot(t,x)
title(' Input signal y(t) = 2cos(5pi*t)-sin(20pi*t) ')
ylabel('y(t)')
xlabel('Time (s)');

%over-Nyquist would be for example 2*Fs (over 20 Hz)
prompt = ('Set an over-Nyquist rate factor (value > 1): ');
Fs1_factor = input(prompt);
Fs1 = Fs1_factor*Fs;

%under-Nyquist would be for example 0.5*Fs (under 20 Hz)
prompt = ('Set an under-Nyquist rate factor (0 < value < 1): ');
Fs2_factor = input(prompt);
Fs2 = Fs2_factor*Fs;

%defining new time arrays based on new sampling rates
t1 = [0:1/Fs1:3]
t2 = [0:1/Fs2:3]

%calculating y(t) with the sampling rates
x1 = 2*cos(5*pi*t1) - sin(20*pi*t1);
x2 = 2*cos(5*pi*t2) - sin(20*pi*t2);

%converting values to strings needed for plot titles
Fs1_str = string(Fs1)
Fs2_str = string(Fs2)
Fs1_numsamp = string(length(x1));
Fs2_numsamp = string(length(x2));

subplot(3,1,2)
stem(t1,x1)
title('Sampled at f1 = ' + Fs1_str + 'Hz and the first ' + Fs1_numsamp + ' Samples') 
xlabel('Time (s)');
ylabel('y(t)');

subplot(3,1,3)
stem(t2,x2)
title('Sampled at f2 = ' + Fs2_str + 'Hz and the first ' + Fs2_numsamp + ' Samples')
xlabel('Time (s)');
ylabel('y(t)');





