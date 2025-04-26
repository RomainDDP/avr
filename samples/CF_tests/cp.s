.global main
.section .text

main:

    LDI R16, 0x05
    LDI R17, 0x05
    CP R16, R17     ; SREG 2

    LDI R16, 0x04
    LDI R17, 0x05
    CP R16, R17     ; 35

    LDI R16, 0x85
    LDI R17, 0x05
    CP R16, R17     ; 14

    LDI R16, 0x05
    LDI R17, 0x04
    CP R16, R17     ; 00

    LDI R16, 0x7F
    LDI R17, 0xFF
    CP R16, R17     ; 0D

    LDI R16, 0xFF
    LDI R17, 0x01
    CP R16, R17     ; 14
