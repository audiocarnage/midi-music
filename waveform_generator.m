# Basic waveform generator functions

format compact; format long g; close all; clear all; clc;

# sampling frequency in Hz
fs = 44.1e3

% signal frequency in Hz
f = 100

# signal period in samples
T = 1/f*fs

# signal period in s
Ts = 1/fs

# amplitude
A = 0.1;

# plotting
rows = 4;
cols = 2;
index = 0;
window = T*2

# SINE WAVE GENERATOR
x = 0:fs;
x_t = x*Ts;
y = A * sin(2 * pi * f * x / fs);
audiowrite('sine.wav', y, fs);

figure(1, 'name', 'basic wave forms ("continuous" vs. sampled")', 'position', [0, 0, 1910, 1000]);
subplot(rows, cols, ++index);
plot(x_t(1:window), y(1:window) / A, 'linewidth', 2), grid minor;
title(sprintf('sine wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('time \rightarrow [s]');
ylabel('y = sin(2 * pi * f / fs)');

subplot(rows, cols, ++index);
stem(x(1:window), y(1:window) / A, '.r', 'linewidth', 1), grid minor;
title(sprintf('sine wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('samples');
xlim([0 window]);
ylabel('y = sin(2 * pi * f / fs)');

# --------------------------------------

# SQUARE WAVE GENERATOR

waveform = [ones(1, floor(T/2)) -1*ones(1, ceil(T/2))];
y = repmat(A * waveform, 1, 1000);
audiowrite('square.wav', y, fs);

subplot(rows, cols, ++index);
plot(x_t(1:window), y(1:window) / A, 'linewidth', 2), grid minor;
title(sprintf('square wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('time \rightarrow [s]');

subplot(rows, cols, ++index);
stem(x(1:window), y(1:window) / A, '.r', 'linewidth', 1), grid minor;
title(sprintf('square wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('samples');
xlim([0 window]);

# --------------------------------------

# SAW WAVE GENERATOR

waveform = linspace(-1, 1, T);
y = repmat(A * waveform, 1, 1000);
audiowrite('saw.wav', y, fs);

subplot(rows, cols, ++index);
plot(x_t(1:window), y(1:window) / A, 'linewidth', 2), grid minor;
title(sprintf('saw wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('time \rightarrow [s]');

subplot(rows, cols, ++index);
stem(x(1:window), y(1:window) / A, '.r', 'linewidth', 1), grid minor;
title(sprintf('saw wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('samples');
xlim([0 window]);

# --------------------------------------

# TRIANGLE WAVE GENERATOR

waveform = [linspace(-1, 1, T/2) linspace(1, -1, T/2)];
y = repmat(A * waveform, 1, 1000);
audiowrite('tringle.wav', y, fs);

subplot(rows, cols, ++index);
plot(x_t(1:window), y(1:window) / A, 'linewidth', 2), grid minor;
title(sprintf('triangle wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('time \rightarrow [s]');

subplot(rows, cols, ++index);
stem(x(1:window), y(1:window) / A, '.r', 'linewidth', 1), grid minor;
title(sprintf('triangle wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('samples');
xlim([0 window]);
