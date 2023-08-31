% ELEC342 LAB3, Question 1 (a)


clc;
clear;

global n;
prompt = ('Enter the number of periods: ');
n = input(prompt)

prompt = ('Enter the step size of the frequency interval: ');
step_size = input(prompt)

global w;
w = [-n*pi : step_size : n*pi]


for loop = 1 : 5
    prompt = ('Enter the sampling rate: '); 
    N = input(prompt)
    
    
    N = floor(2*N);
    
    n = [0:N-1]
    x = sin(2*pi*n/N)
    %for index = 1 : 2*N
    %    x(index) = sin((2*pi/N)*(index-1))
    %end
    
    x_dtft = findDTFT(x);
    
    
    subplot(2,5,2*loop-1)
    stem (n,x)
    xlabel(' n ')
    ylabel(' x[n] ')
    
    
    subplot(2,5,2*loop)
    plot(w,abs(x_dtft));
    xlabel(' w ')
    ylabel(' X[w] ')
end
    
    
