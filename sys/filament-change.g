; =====================================================================================================================
; Filament Change =====================================================================================================================
M83                                                                            ; relative extruder moves
G1 E-10 F3600                                                                  ; retract 10mm of filament
G91                                                                            ; relative positioning
G1 Z5 F360                                                                     ; lift Z by 5mm
G90                                                                            ; absolute positioning
G1 X2 Y2 F6000                                                                 ; go to X=240 Y=-4