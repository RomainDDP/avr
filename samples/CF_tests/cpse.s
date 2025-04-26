.global main
.section .text
    main:
        LDI     r19, 0x11        
        LDI     r16, 0x10        ; Charge 0x10 dans r16
        LDI     r17, 0x10        ; Charge 0x10 dans r17

        CPSE    r16, r17         ; Compare r16 et r17, doit sauter si égaux
        
        MOV     r18, r19         ; Cette instruction sera SKIPPÉE si r16 == r17
        
        LDI     r20, 0x42        ; Charge une valeur fixe pour confirmer la suite
