.global main
.section .text

main:
    ; Initialisation
    LDI r16, 0x01       ; r16 = 0x01
    LDI r17, 0x02       ; r17 = 0x02
    LDI r18, 0xFF       ; r18 = 0xFF (valeur négative)
    LDI r19, 0x00       ; r19 = 0x00

    ; Test 1: Addition sans retenue, sans overflow, résultat positif
    ADD r16, r1        ; r16 = 0x01 + 0x02 = 0x03
    ; Vérification des flags dans S_REG
    ; S_REG devrait être 0x00 (aucun flag activé)

    ; Test 2: Addition avec retenue, sans overflow, résultat négatif
    LDI r16, 0xFF       ; r16 = 0xFF
    ADD r16, r17        ; r16 = 0xFF + 0x02 = 0x01 (avec retenue)
    ; Vérification des flags dans S_REG
    ; S_REG devrait être 0x01 (Carry Flag activé)

    ; Test 3: Addition avec overflow, résultat négatif
    LDI r16, 0x7F       ; r16 = 0x7F
    LDI r17, 0x01       ; r17 = 0x01
    ADD r16, r17        ; r16 = 0x7F + 0x01 = 0x80 (overflow)
    ; Vérification des flags dans S_REG
    ; S_REG devrait être 0x14 (Overflow Flag et Negative Flag activés)

    ; Test 4: Addition sans overflow, résultat zéro
    LDI r16, 0xFF       ; r16 = 0xFF
    LDI r17, 0x01       ; r17 = 0x01
    ADD r16, r17        ; r16 = 0xFF + 0x01 = 0x00 (avec retenue)
    ; Vérification des flags dans S_REG
    ; S_REG devrait être 0x03 (Zero Flag et Carry Flag activés)

stop:
    
