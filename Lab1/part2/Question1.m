% ELEC342 LAB1, Part II Question 1


clc;
clear;

n = [0:9];

x = zeros(1,10);
x(2:4) = 1

for index = 1:10
    if index == 1
        fn(index) = x(index)
    else
        fn(index) = x(index) + (1/4)*fn(index-1)
    end
end

stem(n,fn)
xlabel(' n ')
ylabel(' y[n] ')
