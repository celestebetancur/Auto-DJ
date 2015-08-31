#!/usr/bin/python

import librosa 

def getbpm(f):
	x, fs = librosa.load(f)

	tempo, beat_frames = librosa.beat.beat_track(x,fs)

	print '\ntempo is %i bpm\n' %int(tempo)

