.global main
.section .text

main:
    ; Test BRGE : cas où R16 >= R17
    LDI R16, 0x05    ; 5
    LDI R17, 0x04    ; 4
    CP R16, R17      ; Compare 5 - 4, Résultat positif => BRGE doit sauter
    BRGE label_ge    ; Si R16 >= R17, saut
    LDI r30, 0xFE    ; Ne doit pas arriver ici si BRGE fonctionne
    RJMP stop

label_ge:
    LDI r31, 0xAA    ; OK : BRGE a sauté ici

stop:
