% ELEC342 LAB1, Part II Question 2


clc;
clear;

n = [0:9];

x = zeros(1,10);
x(2:4) = 1

for ind=1:9
    h(ind)=(1/4)^ind;
end
disp(h)

C = conv(h,x)
size_fn = size(h);
size_x = size(x);
size_conv = size_fn(2) + size_x(2) - 2
index_conv = [ 0:size_conv ]

stem(index_conv,C)
xlabel(' n ')
ylabel(' H[n] * x[n] ')
