% ELEC342 PRELAB4, Question 2 (part d)


clc;
clear;

bw_filter = butterworth_from_fdatool;
[b,a] = sos2tf(bw_filter.sosMatrix, bw_filter.ScaleValues);
c = round(a);
d = round(b);

subplot(2,1,1)
zplane(b,a)
title(' zero-pole plot using original coefficients of Butterworth Filter ')

subplot(2,1,2)
zplane(d,c);
title(' zero-pole plot using rounded coefficients of Butterworth Filter ')

