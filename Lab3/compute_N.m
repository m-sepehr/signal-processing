function compute_N = compute_N(sampling_rate,periods,x, w,n)
%COMPUTE_N
%   Detailed explanation goes here
N = floor(sampling_rate/periods);

%n = (-10:10);
%x = zeros(1,length(n));
%x (n>=-2 & n<= 2) = 1;
%w = -pi:0.1:pi;
%q = -pi:0.1:pi;
q = zeros(1,length(w));
for i = 1:length(w)
    
sum = 0;
for z = 1:length(n)
sum = sum + (x(z)*exp(-j*w(i)*n(z)));    
end
q(i) = sum;
end
%subplot(1,2,1);
%stem(n,x);
%subplot(1,2,2);
%plot(w,abs(q));


compute_N = q;

