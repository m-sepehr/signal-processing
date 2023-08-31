function fourier_x = findFourier(loop)
    prompt = ('Enter the sampling rate in terms of number of times of Nyquist rate');
    N = input(prompt)
    
    N = N*2;
    N = floor(N);
    
    global w;
    global n;
    n = [0:2*N-1]
    
    for index = 1 : 2*N
        x(index) = sin((2*pi/N)*(index-1))
    end
    
    
    x_dtft = findDTFT(x);
    
    
    subplot(2,5,2*loop-1)
    stem (n,x)
    
    
    subplot(2,5,2*loop)
    plot(w,x_dtft);
end