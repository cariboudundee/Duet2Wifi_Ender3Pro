; homeall.g
; called to home all axes

M98 P"homex.g"
M98 P"homey.g"
M98 P"homez.g"
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Thu Aug 13 2020 17:50:18 GMT+0200 (heure d’été d’Europe centrale)
;G91                     ; relative positioning
;G1 H2 Z5 F9000          ; lift Z relative to current position
;G1 H1 X-240 Y-240 F9000 ; move quickly to X and Y axis endstops and stop there (first pass)
;G1 H2 X5 Y5 F9000       ; go back a few mm
;G1 H1 X-240 Y-240 F600  ; move slowly to X and Y axis endstops once more (second pass)
;G90                     ; absolute positioning
;G1 X117 Y157 F15000        ; go to first bed probe point and home Z
;G30                     ; home Z by probing the bed

; Uncomment the following lines to lift Z after probing
;G91                    ; relative positioning
;G1 Z5 F150             ; lift Z relative to current position
;G90                    ; absolute positioning


