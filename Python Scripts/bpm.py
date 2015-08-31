#!/usr/bin/python

import librosa 
import essentia.standard as ess

def getbpm(f):
	x, fs = librosa.load(f)

	tempo, beat_frames = librosa.beat.beat_track(x,fs)

	print '\ntempo is %i bpm - librosa(bpm)\n' %int(tempo)

	return tempo

def gettempo(f):
	x, fs = librosa.load(f)
	
	onset_env = librosa.onset.onset_strength(x, sr=fs)
	tempo = librosa.beat.estimate_tempo(onset_env, sr=fs)
	
	print 'tempo is %i bpm - librosa(onset)\n' %int(tempo)

	return tempo

def gettempoessentia(f):
	x, fs = librosa.load(f)

	avg_bpm, beat_start, confidence, tempo, beat_duration = ess.RhythmExtractor2013(method='multifeature')(x)

	print 'tempo is %i  bpm - essentia\n' %int(avg_bpm)
	print tempo

	return avg_bpm

