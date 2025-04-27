.global main
.section .text


main:
    ; Initialisation
    LDI R16, 0x04
    LDI R17, 0x05
    CP R16, R17     ; 35
    BRCC stop
    LDI r30, 0xFF 
    BRCS stop
    LDI r30, 0xFD 

stop :