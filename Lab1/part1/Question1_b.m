% ELEC342 LAB1, Question 1 (b)


clc;
clear;

n = [ 0 : 9 ];

x = sin((2*pi/10)*n);
y = x .^2;

Yenergy = 0;
Xenergy = 0;

disp('The energy for X[n] is ')
disp(calculateEnergy(x,n))

disp ('The energy for Y[n] is ')
disp(calculateEnergy(y,n))

function energy = calculateEnergy(array,n)
    energy = 0;
    for index = n+1 
        energy = energy + (abs(array(index))).^2;
    end
end 
