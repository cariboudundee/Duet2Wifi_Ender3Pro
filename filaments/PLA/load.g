
G10 S200                                                                                          ; Réglez la température actuelle de l'outil à 200 ° C 
M116                                                                                              ; Attendre que les températures soient atteintes  
G1 E10 F600                                                                                       ; Avancez 10 mm de filament à 600 mm / min 
G1 E80 F3000                                                                                      ; Avancez 80 mm de filament à 3000 mm / min 
G1 E50 F300                                                                                       ; Avancez 50 mm de filament à 300 mm / min 
G4 P1000                                                                                          ; Attendez une seconde 
G1 E-2 F1800                                                                                      ; Rétracter 2 mm de filament à 1800 mm / min 
M400                                                                                              ; Attendez les mouvements pour terminer 
M292                                                                                              ; Cachez le message 
G10 S0                                                                                            ; Éteignez à nouveau le chauffage