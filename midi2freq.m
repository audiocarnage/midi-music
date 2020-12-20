# MIDI note to frequency conversion

# https://newt.phys.unsw.edu.au/jw/notes.html
# m: MIDI note

function[f] = midi2freq(m)

f = 440 * 2^((m - 69) / 12);

endfunction