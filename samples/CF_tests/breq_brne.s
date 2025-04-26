.global main
.section .text

main:
    ; Initialisation
    LDI r16, 0x01       ; r16 = 0x01
    LDI r17, 0x02       ; r17 = 0x02
    LDI r18, 0xFF       ; r18 = 0xFF (valeur négative)
    LDI r19, 0x00       ; r19 = 0x00

    ; Test de RJMP (Saut inconditionnel)
    RJMP test_rjmp
    LDI r19, 0xFF       ; Cette instruction ne devrait pas être exécutée

test_rjmp:
    LDI r19, 0x01       ; r19 = 0x01

    ; Test de BRNE (Saut si différent)
    CP r16, r17         ; Compare r16 et r17
    BRNE test_brne
    LDI r30, 0xFA        ; Cette instruction ne devrait pas être exécutée

test_brne:
    LDI r19, 0x02       ; r19 = 0x02

    ; Test de BREQ (Saut si égal)
    LDI r16, 0x02       ; r16 = 0x02
    CP r16, r17         ; Compare r16 et r17
    BREQ test_breq
    LDI r30, 0xFB        ; Cette instruction ne devrait pas être exécutée

test_breq:
    LDI r19, 0x03       ; r19 = 0x03

    ; Test de BRCS (Saut si retenue)
    ADD r16, r18        ; Addition avec retenue (r16 = 0x02 + 0xFF = 0x01 avec retenue)
    BRCS stop
    LDI r30, 0xFC        ; Cette instruction ne devrait pas être exécutée

stop:
    
