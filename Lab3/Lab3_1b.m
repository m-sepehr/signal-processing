% ELEC342 LAB3, Question 1 (b)


clc;
clear;

global n;


prompt = ('Enter the sampling rate: ');
N = input(prompt)
    
N = floor(2*N);

global w;


for loop = 1 : 5
    
    prompt = ('Enter the window size: ');
    window_size = input(prompt);
    n = [0 : (window_size * N)-1]
    
    w = [-window_size*pi : 0.05 : window_size*pi]
    x = sin(2*pi*n/N);
    %for index = 1 : n
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
    
    
