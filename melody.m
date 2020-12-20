format compact; format long g; clear all; clc;

bpm = 120;
fs = 48e3;
amp = 0.2;

beats = [1 1 1 5 1 1 1 5];
notes = [64 66 67 72 62 64 66 71];

sawTone = @(len, T) repmat(linspace(-1, 1, T*fs), 1, round(len/T));
triangleTone = @(len, T) repmat([linspace(-1, 1, (T*fs)/2) linspace(1, -1, (T*fs)/2)], 1, round(len/T));

melody = [];
for i=1:length(beats)
  noteFreq = midi2freq(notes(i));
  noteDuration = beats2sec(beats(i), bpm);
  sawMelodyTone = amp * sawTone(noteDuration, 1 / noteFreq);
  triangleMelodyTone = amp * triangleTone(noteDuration, 1 / noteFreq);
  melody = [melody triangleMelodyTone];
endfor

audiowrite('melody.wav', melody, fs);
