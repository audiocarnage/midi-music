# Basic waveform generator functions

format compact; format long g; close all; clear all; clc;

# sampling frequency in Hz
fs = 100

% signal frequency in Hz
f = 1

# signal period in samples
T = 1/f*fs

# signal period in s
Ts = 1/fs

# amplitude
A = 1;

# plots
rows = 4;
cols = 2;
index = 0;
scale = 1;
window = T * scale
x = 0:fs*scale;
x_t = x*Ts;


# SINE WAVE GENERATOR
y = A * sin(2 * pi * f * x / fs);
audiowrite('sine.wav', y, fs);

figure(1, 'name', 'basic wave forms ("continuous" vs. sampled")', 'position', [0, 0, 1910, 1000]);
subplot(rows, cols, ++index);
plot(x_t(1:window), y(1:window), 'linewidth', 2), grid minor;
title(sprintf('sine wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('time t \rightarrow [s]');
ylabel('y = A * sin(2 * pi * f * t / fs)');

subplot(rows, cols, ++index);
stem(x(1:window), y(1:window), '.r', 'linewidth', 1), grid minor;
title(sprintf('sine wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('sample');
xlim([0 window]);
ylabel('amplitude');

# --------------------------------------

# SQUARE WAVE GENERATOR

waveform = [ones(1, floor(T/2)) -1*ones(1, ceil(T/2))];
y = repmat(A * waveform, 1, 1000);
audiowrite('square.wav', y, fs);

subplot(rows, cols, ++index);
plot(x_t(1:window), y(1:window), 'linewidth', 2), grid minor;
title(sprintf('square wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('time t \rightarrow [s]');

subplot(rows, cols, ++index);
stem(x(1:window), y(1:window), '.r', 'linewidth', 1), grid minor;
title(sprintf('square wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('sample');
xlim([0 window]);
ylabel('amplitude');

# --------------------------------------

# SAW WAVE GENERATOR

waveform = linspace(-1, 1, T);
y = repmat(A * waveform, 1, 1000);
audiowrite('saw.wav', y, fs);

subplot(rows, cols, ++index);
plot(x_t(1:window), y(1:window), 'linewidth', 2), grid minor;
title(sprintf('saw wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('time t \rightarrow [s]');

subplot(rows, cols, ++index);
stem(x(1:window), y(1:window), '.r', 'linewidth', 1), grid minor;
title(sprintf('saw wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('sample');
xlim([0 window]);
ylabel('amplitude');

# --------------------------------------

# TRIANGLE WAVE GENERATOR

waveform = [linspace(-1, 1, T/2) linspace(1, -1, T/2)];
y = repmat(A * waveform, 1, 1000);
audiowrite('tringle.wav', y, fs);

subplot(rows, cols, ++index);
plot(x_t(1:window), y(1:window), 'linewidth', 2), grid minor;
title(sprintf('triangle wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('time t \rightarrow [s]');

subplot(rows, cols, ++index);
stem(x(1:window), y(1:window), '.r', 'linewidth', 1), grid minor;
title(sprintf('triangle wave, fs=%d Hz, f=%d Hz', fs, f));
xlabel('sample');
xlim([0 window]);
ylabel('amplitude');
