; Configuration file for Duet WiFi (firmware version 3)
;; executed by the firmware on start-up

; =====================================================================================================================
; General preferences
; =====================================================================================================================
G90                                                      ; send absolute coordinates...
M83                                                      ; ...but relative extruder moves
M550 P"ender"                                            ; set printer name
;M551 P"ender"                                	       	; Set password
;M918 P1 E4 F2000000                                     ; configure direct-connect display

; =====================================================================================================================
; Network
; =====================================================================================================================
M552 S1                                                  ; enable network
M586 P0 S1                                               ; enable HTTP
M586 P1 S1                                               ; enable FTP
M586 P2 S1                                               ; enable Telnet

; =====================================================================================================================
; Drives
; =====================================================================================================================
M569 P0 S1                                              ; physical drive 0 goes backwards
M569 P1 S1                                              ; physical drive 1 goes backwards
M569 P2 S0                                              ; physical drive 2 goes forwards
M569 P4 S1                                              ; physical drive 4 goes forwards
M584 X0 Y1 Z2 E4                                        ; set drive mapping
M350 X16 Y16 Z16 E16 I1                                 ; configure microstepping with interpolation (original)
M92 X80 Y80 Z1600 E129                                  ; set steps per mm (original)
M566 X1000 Y1000 Z20 E3000 P1			           	    ; Set maximum instantaneous speed changes (mm/min)
M203 X12000 Y12000 Z900 E8000				            ; Set maximum speeds (mm/min)
M201 X1800 Y1800 Z60 E4000                              ; set accelerations (mm/s^2) (original)
M204 P600 T1200						                    ; Set accelerations (mm/s^2) for print and travel moves
M906 X1000 Y1000 Z1300 E1300 I30                        ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                 ; Set idle timeout

; =====================================================================================================================
; Axis Limits
; =====================================================================================================================
M208 X0 Y0 Z0 S1                                        ; set axis minima
M208 X235 Y235 Z200 S0                                  ; set axis maxima
;M208 X-117.5:117.5 Y-117.5:117.5 Z0:195                ; set axis limits center bed version

; =====================================================================================================================
; Endstops
; =====================================================================================================================
M574 X1 S1 P"xstop"                                     ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                                     ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S2                                              ; configure Z-probe endstop for low end on Z
M591 D0 P1 C"zstop" S1                                  ; filament monitor connected to Z endstop

; =====================================================================================================================
; Z-Probe
; =====================================================================================================================
M558 P1 C"zprobe.in" H3 A2 S0.3 F200 T6000              ; set Z probe type to IR Duet and the dive height + speeds
G31 P500 X0 Y-32 Z1.9                                   ; set Z probe trigger value, offset and trigger height
M557 X10:225 Y10:193 P4                                 ; define mesh grid

; =====================================================================================================================
; Resume Button
; =====================================================================================================================
M950 J0 C"e0stop"
M950 J1 C"e1stop"
M581 T2 P0 S1 R0                                        ;Runs trigger2.g file when pressed - Resets Load Macros
M581 T6 P0 S1 R1                                        ;Runs trigger6.g file when pressed during print - Resumes print after resetting load macros
M581 T3 P1 S1 R1                                        ;Runs trigger3.g file when pressed during print - Runs before Trigger 7 to get temp back up during print
M581 T7 P1 S1 R0                                        ;Runs trigger7.g file when pressed - First step of Unload process


; =====================================================================================================================
; Heaters
; =====================================================================================================================
M308 S0 P"bedtemp" Y"thermistor" T98801 B4185 A"Lit"    ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                                   ; create bed heater output on bedheat and map it to sensor 0
M307 H0 B0 S1.00                                        ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                 ; map heated bed to heater 0
M143 H0 S120                                            ; set temperature limit for heater 0 to 120C
M308 S1 P"spi.cs1" Y"rtd-max31865" A"Tête"              ; create sensor number 1 as a PT100 sensor in the first position on the Duet 2 daughter board connector
M950 H1 C"e0heat" T1                                    ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                                        ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S270	        	  			                ; Set temperature limit for heater 1 to 270C
M308 S2 P"spi.cs2" Y"rtd-max31865" A"Boitier"           ; configure sensor 2 as thermistor on pin e1temp
;M950 H2 C"e1heat" T2                                   ; create chamber heater output on e1heat and map it to sensor 2
;M307 H2 B1 S1.00                                       ; enable bang-bang mode for the chamber heater and set PWM limit
;M141 H2                                                ; map chamber to heater 2

; =====================================================================================================================
; Heater model parameters
; =====================================================================================================================
;M307 H0 A238.2 C902.2 D0.7 S1.00 V24.1 B0               ;PLA PID setting 60°c
;M307 H1 A345.9 C125.9 D2.1 S1.00 V24.1 B0               ;PLA PID setting 200°c

; =====================================================================================================================
; Fans
; =====================================================================================================================
M950 F0 C"fan1" Q100                                    ; create fan 0 on pin fan0 and set its frequency
M106 P0 C"Hotend Cooling" S1 H1 T45                     ; set fan 0 name and value. Thermostatic control is turned on
M950 F1 C"fan0" Q100                                    ; create fan 1 on pin fan1 and set its frequency
M106 P1 C"Parts Cooling" S0 H-1                         ; set fan 1 name and value. Thermostatic control is turned off
M950 F2 C"fan2" Q100                                    ; create fan 2 on pin fan2 and set its frequency
M106 P2 C"Motherboard Cooling" S1 H1 T40               ; set fan 2 name and value. Thermostatic control is turned on
M950 F3 C"duex.fan3" Q250                               ; create fan 3 on pin fan2 and set its frequency
M106 P3 C"Driver Cooling" S0 H-1                        ; set fan 3 name and value. Thermostatic control is turned off
M950 P0 C"e1heat" Q500                                  ; create output 0 on pin e1heat for use in daemon.g ( go on when printer print )

; =====================================================================================================================
; Tools
; =====================================================================================================================
M563 P0 S"MicroSwiss" D0 H1 F0:1:2                      ; define tool 0
G10 P0 X0 Y0 Z0                                         ; set tool 0 axis offsets
G10 P0 R0 S0                                            ; set initial tool 0 active and standby temperatures to 0C

; =====================================================================================================================
; Pressure Advance
; =====================================================================================================================
M572 D0 S0.10						                    ; set pressure advance to 0.10

; =====================================================================================================================
; Retraction
; =====================================================================================================================
M207 S2 R0.0 F2200 T2200 Z0.4                           ; set retractation to 3mm at 50mm/s and Z hop to 0.4mm 

	; M207: Set retract length
	; Parameters
	; 	Snnn positive length to retract, in mm
	; 	Rnnn positive or negative additional length to un-retract, in mm, default zero
	; 	Fnnn retraction feedrate, in mm/min
	; 	Tnnn feedrate for un-retraction if different from retraction, mm/min (RepRapFirmware 1.16 and later only)
	; 	Znnn additional zlift/hop
	; Example: M207 S4.0 F2400 Z0.075

; FEEDRATE CONVERSIONS
	; 20mm/s = F1200
	; 35mm/s = F2100
	; 50mm/s = F3000
	; 70mm/s = F4200
	; 100mm/s = F6000
	; 120mm/s = F7200
	; 133mm/s = F8000

; =====================================================================================================================
; Custom settings
; =====================================================================================================================
M912 P0 S-2					                        ; CPU temperature calibration
M911 S20 R21 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"      ; set voltage thresholds and actions to run on power loss

; =====================================================================================================================
; Miscellaneous
; =====================================================================================================================
M501                                                    ; load saved parameters from non-volatile memory
T0                                                      ; select first tool





