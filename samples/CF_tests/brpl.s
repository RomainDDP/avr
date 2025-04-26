.global main
.section .text

main:
    ; --- Test 1: Résultat positif (doit sauter) ---
    LDI R16, 0x06
    LDI R17, 0x02
    SUB R16, R17        ; 6 - 2 = 4 (positif)
    BRPL positif_1
    LDI R25, 0x01       ; Erreur : pas sauté
    RJMP stop

positif_1:
    LDI R26, 0x01       ; OK : résultat positif détecté

    ; --- Test 2: Résultat négatif (ne doit PAS sauter) ---
    LDI R16, 0x01
    LDI R17, 0x05
    SUB R16, R17        ; 1 - 5 = -4 (négatif)
    BRPL erreur_2
    LDI R27, 0x01      ; OK : pas de saut
    RJMP suite

erreur_2:
    LDI R28, 0x01       ; Erreur : a sauté à tort
    RJMP stop

suite:
    ; --- Test 3: Résultat zéro (doit sauter) ---
    LDI R16, 0x07
    LDI R17, 0x07
    SUB R16, R17        ; 7 - 7 = 0 (zéro)
    BRPL positif_3
    LDI R30, 0x22       ; Erreur : pas sauté
    RJMP stop

positif_3:
    LDI R31, 0xB3       ; OK : zéro détecté comme positif

stop:
