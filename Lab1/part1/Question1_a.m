% ELEC342 LAB1, Question 1 (a)


clc;
clear;
n = [ 0 : 9 ];

x = n;
y = x .^2

Yenergy = 0;
Xenergy = 0;

for index = n+1
    Yenergy = Yenergy + (abs(y(index))).^2;
end

for index = n+1
    Xenergy = Xenergy + (abs(x(index))).^2;
end

disp('The energy for X[n] is ')
disp(Xenergy)

disp ('The energy for Y[n] is ')
disp(Yenergy)

    


