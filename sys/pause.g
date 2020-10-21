; =====================================================================================================================
;; Pause macro file
; =====================================================================================================================
M83				         ; relative extruder moves
G1 E-2 F2500			 ; retract 2mm
G91				         ; relative moves
G1 Z5 F5000			     ; Lower Bed 5mm
G90				         ; absolute moves
G1 X0 Y0 F8000		     ; move head out of the way of the print
G10 P0 R0			     ; Set standby Temp of Tool0 to 0 because I can't figure out where to set this in CURA
T-1				         ; Put all tools in Standby

;M106 S0 			    ; Test to turn part cooling fan off - Cant get this to work