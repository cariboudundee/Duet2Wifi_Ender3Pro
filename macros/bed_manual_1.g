M671 X35:35:200:200 Y67:232:232:67 P0.7

G30 P0 X35 Y67 Z-99999 ; probe near an adjusting screw
G30 P1 X35 Y232 Z-99999 ; probe near an adjusting screw
G30 P2 X200 Y232 Z-99999 ; probe near an adjusting screw
G30 P3 X200 Y67 Z-99999 S4 ; probe near an adjusting screw

G28 Z