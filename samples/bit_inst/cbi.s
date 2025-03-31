.global main
.section .text
    main:
        SBI 0, 0
        CBI 0, 0
        SBI 31, 7
        CBI 31, 7
        SBI 1, 4
        CBI 1, 4
        
        
        