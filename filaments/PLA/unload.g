M291 P "Veuillez patienter pendant le chauffage de la buse" R "Déchargement du PLA" T5; Message affiché 
G10 S200                ; Chauffez l'outil actuel à 200C 
M116                    ; Attendre que les températures soient atteintes 
M291 P "Retrait du filament ..." R "Déchargement PLA" T5; Afficher un autre message 
G1 E-20 F300            ; Rétracter 20 mm de filament à 300 mm / min 
G1 E-100 F3000          ; Rétracter 480 mm de filament à 3000 mm / min 
M400                    ; Attendez que les coups finissent 
M292                    ; Masquer à nouveau le message 
M84 E0: 1               ; Éteignez les lecteurs d'extrudeuse 1 et 2