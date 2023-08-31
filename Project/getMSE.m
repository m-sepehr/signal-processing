function MSE = getMSE(signalOne, signalTwo)
%calculating Mean Square Error between original and noisy signals
    sum = 0;
    L = length(signalOne);
    for k = 1:L
        sum = sum + (signalOne(k) - signalTwo(k))^2;
    end
    
    MSE = sum/L
end
