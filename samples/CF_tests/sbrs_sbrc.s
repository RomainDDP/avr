.global main
.section .text

main:
    ; --- Test 1: bit = 1 (doit sauter) ---
    LDI R16, 0b10000000    ; bit 7 = 1
    SBRS R16, 7            ; Vérifie bit 7
    RJMP stop             ; saute ici car bit 7 est à 1
    LDI R25, 0x01  
    LDI R16, 0b10        
    SBRC R16, 0
    RJMP stop
    LDI R26, 0x01
    SBRS R16, 1
    RJMP stop
    LDI R27, 0x01
    SBRC R16, 1
    RJMP stop
    RJMP pb

pb :
    LDI R30,0x01

stop:
