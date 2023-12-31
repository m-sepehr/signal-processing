function y = doFilter(x)
%DOFILTER Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 9.8 and DSP System Toolbox 9.10.
% Generated on: 09-Jun-2023 11:36:01

%#codegen

% To generate C/C++ code from this function use the codegen command.
% Type 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    %
    % N     = 4;     % Order
    % F3dB1 = 1950;  % First
    % F3dB2 = 2050;  % Second
    % Fs    = 8000;  % Sampling Frequency
    %
    % h = fdesign.bandpass('n,f3db1,f3db2', N, F3dB1, F3dB2, Fs);
    %
    % Hd = design(h, 'butter', ...
    %     'SystemObject', true);
    
    Hd = dsp.BiquadFilter( ...
        'Structure', 'Direct form II', ...
        'SOSMatrix', [1 0 -1 1 0.0540637301548843 0.945977983156391; 1 0 -1 ...
        1 -0.0540637301548842 0.945977983156392], ...
        'ScaleValues', [0.0382140851719326; 0.0382140851719326; 1]);
end

s = double(x);
y = step(Hd,s);

