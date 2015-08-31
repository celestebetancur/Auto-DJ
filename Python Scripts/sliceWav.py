#!/usr/bin/python

import wave 
import struct

def slice(f,w,init,end):
    outFile = wave.open('cutted_'+f,'w')

    outFile.setparams((2,2,44100,0,'NONE','not compressed'))

    w.setpos(init)

    for i in range((end-w.tell())):
		
        frames = w.readframes(1)
        outFile.writeframes(frames)

    outFile.close()


