.global main
.section .text
    main:
        LDI     r19, 0x11        

        rjmp start 
        LDI     r16, 0x10  

    start :
        LDI     r17, 0x10        ; Charge 0x10 dans r17