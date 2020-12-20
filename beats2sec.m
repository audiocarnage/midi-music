# beats per second

# input:
# b: beats
# bpm: beats per minute

function[s] = beats2sec(b, bpm)

s = b * (1 / bpm) * 60;

endfunction