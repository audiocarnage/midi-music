# Generate the happy birthday melody with two simple oscillators (saw and triangle tone)

format compact; format long g; clear all; clc;

# beats per minute
bpm = 160;

# sampling rate
fs = 48e3;

beats = [0.5 0.5 1 1 1  2   0.5 0.5 1 1 1  2   0.5 0.5 1 1 1  1  2   0.5 0.5 1 1 1 3];
#        G4 G4 A3 G4 C1 B2  G4 G4 A3 G4 D2 C1  G4 G4 G5 E3 C1 B2 A3  F4 F4 E3 C1 D2 C1
notes = [67 67 57 67 24 47  67 67 57 67 38 24  67 67 79 52 24 47 57  65 65 52 24 38 24];

sawTone = @(len, T) repmat(linspace(-1, 1, T*fs), 1, round(len/T));
triangleTone = @(len, T) repmat([linspace(-1, 1, (T*fs)/2) linspace(1, -1, (T*fs)/2)], 1, round(len/T));

# MIDI note to frequency conversion
# https://newt.phys.unsw.edu.au/jw/notes.html
# input: MIDI note
midi2freq = @(m) 440 * 2^((m - 69) / 12);

# compute beats per second, input: beats, bpm
beats2sec = @(b, bpm) b * (1 / bpm) * 60;

sawMelody = [];
triangleMelody = [];
for i=1:length(beats)
  noteFreq = midi2freq(notes(i));
  noteDuration = beats2sec(beats(i), bpm);
  sawMelody =  [sawMelody 0.25 * sawTone(noteDuration, 1 / noteFreq)];
  triangleMelody = [triangleMelody 0.75 * triangleTone(noteDuration, 1 / noteFreq)];
endfor

triangleMelody(length(triangleMelody) : length(sawMelody)) = 0;
melody = sawMelody + triangleMelody;

audiowrite('melody.wav', melody, fs);
