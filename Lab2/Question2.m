% ELEC342 LAB2, Part I Question 2


clc;
clear;

n = [1:21];
w = [0:0.2992:2*pi]

x = zeros(1,21)
x(9:13) = 1;

w_array = 0;

for a = 1:length(w)
    sum = 0;
    
    for b = 1:length(n)
        sum = sum + (x(b) * exp(-(1i)*w(a)*n(b)))
    end
    
    w_array(a) = sum
end

mag_of_w_array = abs(w_array)

x_fft = fft(x);
mag_of_x_fft = abs(x_fft);

subplot(1,3,1)
stem(n,x)
xlabel(' n ')
ylabel(' x[n] ')
title (' input x[n] ')

subplot(1,3,2)
plot(w,mag_of_w_array)
xlabel(' w ')
ylabel(' X[w] ')
title(' DTFT of pulse x[n] ')

subplot(1,3,3)
plot(w,mag_of_x_fft)
xlabel(' w ')
ylabel(' X[w] ')
title(' DTFT of pulse x[n] using fft ')
