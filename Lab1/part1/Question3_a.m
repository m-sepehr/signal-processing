% ELEC342 LAB1, Part I Question 3 (a)


clc;
clear;

n = [0:10];
x = n;
x_neg = -n

fn1 = exp((-2).*abs(x)).*sin((2*pi/36).*x)
fn2 = exp((-2).*abs(x_neg)).*sin((2*pi/36).*x_neg)

even_comp = (fn1 + fn2)/2
odd_comp = (fn1 - fn2)/2

subplot(4,1,1)
stem(n,fn1)
xlabel(' n ')
ylabel(' x[n] ')
title(' x[n] ')

subplot(4,1,2)
stem(n,fn2)
xlabel(' n ')
ylabel(' x[-n] ')
title(' x[-n] ')

subplot(4,1,3)
stem(n,even_comp)
xlabel(' n ')
ylabel(' xe[n] ')
title(' Even component of x[n] ')

subplot(4,1,4)
stem(n,odd_comp)
xlabel(' n ')
ylabel(' xo[n] ')
title(' Odd component of x[n] ')
