ORG 100H
.DATA 
    STR1 DB "HELLO CLASS!$"
    STR2 DB 15 DUP(?), '$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    
    STD
    LEA SI, STR1+11
    LEA DI, STR2
    
    MOV CX, 11
    MOVSB
    
    REVERSE:
        ADD DI, 2 
        MOVSB
        LOOP REVERSE
        
    DISPLAY:
        MOV AH, 9
        LEA DX, STR2 
        INT 21H
        
    EXIT:
        MOV AH, 4CH
        INT 21H
        
MAIN ENDP
END MAIN