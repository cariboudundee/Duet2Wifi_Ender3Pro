; pause.g
; called when a print from SD card is paused
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Thu Aug 13 2020 17:50:18 GMT+0200 (heure d’été d’Europe centrale)
M83            ; relative extruder moves
G1 E-10 F3600  ; retract 10mm of filament
G91            ; relative positioning
G1 Z5 F360     ; lift Z by 5mm
G90            ; absolute positioning
G1 X5 Y5 F6000 ; go to X=5 Y=5
