ORG 100H

.DATA 
    ARR DB 21, 32, 1, 22, 23, 45, 78, 42, 9
    MSG1 DB "Even Number: $"
    MSG2 DB "Odd Number $"
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BH, 0
    MOV BL, 0 
    MOV CX, 9
    
    LEA SI, ARR
    
    CHECK:
        MOV AL, [SI]
        
        TEST AL, 1
        JZ COUNT_E
        
        JMP COUNT_O
        
        COUNT_E:
            INC BL
            JMP LP 
        
        COUNT_O:
            INC BH
            JMP LP
        LP:
            INC SI
            LOOP CHECK 
            
    PRINT:
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
        
        MOV AH, 2
        MOV DL, BH
        ADD DL, 30H
        INT 21H
        
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H
        
        MOV AH, 9
        LEA DX, MSG1
        INT 21H
        
        MOV AH, 2
        MOV DL, BL 
        ADD DL, 30H
        INT 21H
        
    EXIT:
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN