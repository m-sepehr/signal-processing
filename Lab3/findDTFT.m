function dtft = findDTFT(x)
global n;
global w;

w_array = 0;

for a = 1:length(w)
    sum = 0;
    
    for b = 1:length(n)
        sum = sum + (x(b) * exp(-(1j)*w(a)*n(b)));
    end
    
    w_array(a) = sum;
end

dtft = w_array;

end