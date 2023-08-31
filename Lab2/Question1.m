% ELEC342 LAB2, Part I Question 1


clc;
clear;

n = [-10:10]
w = [-pi:0.1:pi]

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

subplot(1,2,1)
stem(n,x)
xlabel(' n ')
ylabel(' x[n] ')
title (' input x[n] ')

subplot(1,2,2)
plot(w,mag_of_w_array)
xlabel(' w ')
ylabel(' X[w] ')
title(' DTFT of pulse x[n] ')


    
