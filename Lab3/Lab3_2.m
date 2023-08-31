% ELEC342 LAB3, Question 2


clc;
clear;

global n;
prompt = ('Enter the number of periods: ');
num_periods = input(prompt)

prompt = ('Enter the step size of the frequency interval: ');
step_size = input(prompt)

global w;
w = [-num_periods*pi : step_size : num_periods*pi];


for loop = 1 : 5
    prompt = ('Enter the sampling: ');
    N = input(prompt)
    
    
    N = floor(2*N)
    
    n = [0:N-1]
    x = 0.5*sin(2*pi*n/N) + 0.33*sin(4*pi*n/N)
    %for index = 1 : N
    %    x(index) = (0.5*sin((2*pi/N)*(index-1)) + 0.33*sin((4*pi/N)*(index-1)));
    %end
    
    x_dtft = findDTFT(x); 
    
    subplot(2,5,2*loop-1)
    stem (n,abs(x))
    xlabel(' n ')
    ylabel(' |x[n]| ')
    
    
    subplot(2,5,2*loop)
    polar(angle(x_dtft), abs(x_dtft));
    title(' Polar plot of Fourier transform of x[n] ')
end
