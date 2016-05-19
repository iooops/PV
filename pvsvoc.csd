<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac  ;;;realtime audio out
-iadc    ;;;uncomment -iadc if realtime audio input is needed too
--midi-key-cps=4 --midi-velocity=5
-B 4096
; For Non-realtime ouput leave only the line below:
; -o pvsvoc.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

gisaw	ftgen	1, 0, 2048, 10, 1, 0.5, 0.3, 0.25, 0.2	;sawtooth-like

instr 1

asig in					;get the signal in
asyn poscil p5/127, p4, gisaw		;excitation signal of 150 Hz

famp pvsanal asig, 1024, 256, 1024, 1	;analyse in signal
fexc pvsanal asyn, 1024, 256, 1024, 1	;analyse excitation signal
ftps pvsvoc  famp, fexc, 1, 1		;cross it
atps pvsynth ftps			;synthesise it                      
     outs atps, atps

endin
</CsInstruments>
<CsScore>
e	3600
</CsScore>
</CsoundSynthesizer> 
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
