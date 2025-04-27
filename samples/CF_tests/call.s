.global main
.section .text

main:
    ; Initialisation
    LDI r16, 0x01      

    RCALL sub

    MOV r16, r18

stop :
    BRID ex2
    rjmp ex1

sub:
    MOV r16, r17      
    RETI

ex1 :
    rjmp ex

ex2 :
    LDI r20, 0x02

ex :
