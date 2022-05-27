% Use the MATLAB buttap and lp2lp functions to find the transfer function
% of a third-order Butterworth low-pass filter with cutoff frequency fc =
% 2KHz. Then, plot its frequency response. Print your code, results and figures.

[x, y, z] = buttap(3);
% Calculate numerator, denominator coefficients of the filter
[a, b] = zp2tf(x, y, z);
% Define frequency range and convert it to rad/sec
f = 1000:1500 / 50:10000;
w = 2 * pi * f;
% Define cutoff frequency and convert it to rad/sec
fc = 2000;
wc = 2 * pi * fc;
% Calculate numerator, denominator of the filter
[an, bn] = lp2lp(a, b, wc);
% Calculate transfer function of the filter and plot it
Gs = freqs(bn, an, w);
semilogx(w, abs(Gs));
grid;
hold on;
xlabel('Radian Frequency (rad/sec)'),
ylabel('Magnitude of Transfer Function'),
title('Frequency respone plot for 3-pole Butterworth low-pass filter')
