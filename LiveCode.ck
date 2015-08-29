Gain gate => NRev rev => dac;

0.05 => rev.mix;

FMSynth fm => Pan p => gate;
Melody melody => Audio audio => gate; 
Drum drum => gate;
Bass bass => gate; 
Harmony har => audio => gate;
EFX efx => gate;

CHmUsiCK.master(0.2);

day => now;