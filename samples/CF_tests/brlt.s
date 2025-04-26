.global main
.section .text

main:
    LDI R16, 0x05    ; 5
    LDI R17, 0xF4    ; négatif
    CP R17, R16      ; 
    BRLT label_lt   ; 
    LDI r30, 0xFE    ; Ne doit pas arriver ici si BRLT fonctionne
    RJMP stop

label_lt:
    LDI r31, 0xAA    ; OK : BRLT a sauté ici

stop:
