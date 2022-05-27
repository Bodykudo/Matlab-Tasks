% Use the MATLAB functions buttap and lp2bp to find the transfer function
% of a 3-pole Butterworth analog band-pass filter with the pass band
% frequency centered at f0 = 4 KHz, and bandwidth BW = 2 KHz. Then, plot
% its frequency response. Print your code, results and figures.

% Design 3-pole Butterworth low-pass filter
[x, y, z] = buttap(3);

% Calculate numerator, denominator coefficients of the filter
[a, b] = zp2tf(x, y, z);

% Define frequency range, centered frequency at 4 KHz and convert it to rad/sec
f = 100:100:100000;
f0 = 4000;
W0 = 2 * pi * f0;

% Define bandwidth and convert it to rad/sec
fbw = 2000;
Bw = 2 * pi * fbw;

% Calculate numerator, denominator of band-pass filter
[an, bn] = lp2bp(a, b, W0, Bw);

% Calculate magnited of the transfer function of the band-pass filter and plot it
Gs = freqs(bn, an, 2 * pi * f);
semilogx(f, abs(Gs));
grid;
hold on;
xlabel('Frequency (Hz)');
ylabel('Magnitude of Transfer Function');
title('Frequency respone plot for 3-pole Butterworth band-pass filter');
