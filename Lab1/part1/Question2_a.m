% ELEC342 LAB1, Question 2 (a)


clc;
clear;

n = [ 0 : 10 ];

x1 = sin((2*pi/10)*n);
y1 = 2.*x1;

x2 = cos((2*pi/10)*n);
y2 = 2.*x2;

x3 = x1 + x2;
y3 = 2.*x3

y4 = y1 + y2

stem(n,x1)
hold on
stem(n,x2)
stem(n,x3)
stem(n,y1)
stem(n,y2)
stem(n,y3)
stem(n,y4)
hold off
ylabel(' values for all y[n] and x[n] ')
xlabel (' n ')
legend;

%subplot(2,1,2)
%stem(n,x1)
%ylabel(' X2[n] ')
%xlabel(' n ')

if ( y3 == y4 )
    disp('The system is linear')
else 
    disp ('The system is NOT linear')
end





