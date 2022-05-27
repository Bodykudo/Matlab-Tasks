% Use the MATLAB bode function to plot the magnitude and phase
% characteristics of the 3-pole Butterworth low-pass filter with unity gain and
% normalized frequency at ωc = 1 rad/sec. Print your code, results and figures.

numerator = [0 0 0 1];
denominator = [1 2 2 1];
bode(numerator, denominator);
title("Bode plot for 3-pole Butterworth low-pass filter");
grid;
