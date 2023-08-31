function Hd = getFilter
%GETFILTER Returns a discrete-time filter System object.

% MATLAB Code
% Generated by MATLAB(R) 9.8 and DSP System Toolbox 9.10.
% Generated on: 09-Jun-2023 11:30:57

N     = 4;     % Order
F3dB1 = 1950;  % First
F3dB2 = 2050;  % Second
Fs    = 8000;  % Sampling Frequency

h = fdesign.bandpass('n,f3db1,f3db2', N, F3dB1, F3dB2, Fs);

Hd = design(h, 'butter', ...
    'SystemObject', true);


