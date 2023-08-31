% ELEC342 LAB1, Part II Question 3 (b)


clc;
clear;

n = [-10:10];
shift = -2;
size_n = size(n);
x1 = n;
fn1 = Sys1(x1);
if (shift <= 0)
    fn1 = fn1(1:size_n(2)+1+shift)
else
    fn1 = fn1(shift+1:size_n(2)+1)
end

x2 = n + shift;
fn2 = Sys1(x2);
if (shift <= 0)
    fn2 = fn2(-shift+1:size_n(2)+1)
else
    fn2 = fn2(1:size_n(2)+1-shift)
end

if ( fn1 == fn2 )
    disp ('Time Invariant')
else
    disp ('Time Variant')
end

size_fn = size(fn1);
index_fn = [-10-shift:size_fn(2)-11-shift];
subplot(2,1,1)
stem(index_fn,fn1)
xlabel('x')
ylabel(' Sys1(x) ')
title(' Sys1(x) ')

subplot(2,1,2)
stem(index_fn,fn2)
xlabel('x')
ylabel(' Sys1(x) ')
title(' Sys1(x + shift) ')
