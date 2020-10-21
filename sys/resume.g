; =====================================================================================================================
;; Resume macro file
; =====================================================================================================================
T0			             ;Re-Activate Tool 0	
M116			         ;Wait for it to come back up to Temp
G1 R1 X0 Y0 Z2 F5000 	 ;go to 5mm above position of the last print move
G1 R1 X0 Y0 Z0 		     ;go back to the last print move
