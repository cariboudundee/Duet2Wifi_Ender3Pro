; homey.g
; called to home the Y axis
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Thu Aug 13 2020 17:50:18 GMT+0200 (heure d’été d’Europe centrale)
G91               ; relative positioning
G1 H2 Z5 F8000    ; lift Z relative to current position
G1 H1 Y-300 F8000 ; move quickly to Y axis endstop and stop there (first pass)
G1 H2 Y5 F8000    ; go back a few mm
G1 H1 Y-300 F600  ; move slowly to Y axis endstop once more (second pass)
G1 H2 Z-5 F8000   ; lower Z again
G90               ; absolute positioning

