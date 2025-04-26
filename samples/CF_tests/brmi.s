.global main
.section .text

main:
    ; --- Test 1: Résultat négatif (doit sauter) ---
    LDI R16, 0x01
    LDI R17, 0x02
    SUB R16, R17        ; 1 - 2 = -1 (résultat négatif)
    BRMI negatif_1
    LDI R25, 0x10       ; Erreur: n'a pas sauté
    RJMP stop

negatif_1:
    LDI R26, 0x01       ; OK : résultat négatif détecté

    ; --- Test 2: Résultat positif (ne doit PAS sauter) ---
    LDI R16, 0x05
    LDI R17, 0x02
    SUB R16, R17        ; 5 - 2 = 3 (positif)
    BRMI erreur_2
    LDI R27, 0x11      ; OK : pas de saut
    RJMP suite

erreur_2:
    LDI R28, 0x02       ; Erreur : a sauté à tort
    RJMP stop

suite:
    ; --- Test 3: Résultat zéro (ne doit PAS sauter) ---
    LDI R16, 0x03
    LDI R17, 0x03
    SUB R16, R17        ; 3 - 3 = 0 (zéro)
    BRMI erreur_3
    LDI R30, 0xA3       ; OK : pas de saut
    RJMP stop

erreur_3:
    LDI R31, 0x12       ; Erreur : a sauté à tort

stop:
