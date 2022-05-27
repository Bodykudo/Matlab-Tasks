% Use the MATLAB functions buttap and lp2bs to find the transfer function
% of a 3-pole Butterworth band-elimination (band-stop) filter with the stop
% band frequency centered at f0 = 5 KHz, and bandwidth BW = 2 KHz. Then,
% plot its frequency response. Print your code, results and figures.

% Design 3-pole Butterworth low-pass filter
[x, y, z] = buttap(3);

% Calculate numerator, denominator coefficients of the filter
[a, b] = zp2tf(x, y, z);

% Define frequency range, centered frequency at 5 KHz and convert it to rad/sec
f = 100:100:100000;
fc = 5000;
wc = 2 * pi * fc;

% Define bandwidth and convert it to rad/sec
fbw = 2000;
bw = 2 * pi * fbw;

% Calculate numerator, denominator of desired-band stop filte
[an, bn]=lp2bs(a, b, wc, bw);

% Calculate magnitude of the transfer function of the band-stop filter and plot it
Gs = freqs(an, bn, 2 * pi * f);
semilogx(f,abs(Gs));
grid;
hold on;
xlabel('Frequency (Hz)');
ylabel('Magnitude of Transfer Function');
title('Frequency respone plot for 3-pole Butterworth band-elimination filter');
