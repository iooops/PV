
<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  ;;;realtime audio out
-iadc    ;;;uncomment -iadc if realtime audio input is needed too
-+rtmidi=alsa -M hw:2
--midi-key-cps=4 --midi-velocity-amp=5
-B 4096
; For Non-realtime ouput leave only the line below:
; -o pvsvoc.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
massign 0, 1	;assign all midi-channels to instr 1

gisaw	ftgen	1, 0, 2048, 10, 1, 0.5, 0.3, 0.25, 0.2	;sawtooth-like

instr 1
asig inch 1					;get the signal in
asyn poscil p5, p4, gisaw		;excitation signal of p4 Hz
fftin1 pvsanal asig, 1024, 256, 2048, 1	;analyse in signal
fftin2 pvsanal asyn, 1024, 256, 2048, 1	;analyse excitation signal
ftps pvscross  fftin2, fftin1, p5, 0.5	;cross it
atps pvsynth ftps			;synthesise it                      
     outs atps, atps
endin

</CsInstruments>
<CsScore>
e 3600
</CsScore>
</CsoundSynthesizer> 
