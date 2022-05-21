ORG 100H

.DATA 
    STR DB 15 DUP(?), '$' 
    REV DB 15 DUP(?), '$'
    MSG1 DB "Enter String: $"
    MSG2 DB "It is a palindrome$"
    MSG3 DB "It is not a palindrome$" 
    
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, MSG1
    INT 21H
    
    MOV BX, 0 
    MOV AH, 1
    
    INPUT:
        INT 21H 
        CMP AL, 13
        JE REVERSE_CODE
        
        MOV STR[BX], AL
        
        INC BX
        JMP INPUT
        
    REVERSE_CODE:
        LEA SI, REV
        MOV CX, BX 
        DEC BX
        
        REVERSE:
            MOV AL, STR[BX]
            MOV [SI], AL
            
            INC SI
            DEC BX
            
            LOOP REVERSE
    COMPARE_CODE:
        MOV BX, 0
        XOR SI, SI
        LEA SI, STR
        
        COMPARE:    
            MOV CL, [SI] 
            MOV DL, REV[BX
            INC SI 
            INC BX
            
            CMP CL, '$'
            JE PRINT
            
            CMP CL, DL
            JE COMPARE
            
            PRINT_NEG:
                MOV AH, 2
                MOV DL, 10
                INT 21H
                MOV DL, 13
                INT 21H  
                
                MOV AH, 9
                LEA DX, MSG3
                INT 21H
                JMP EXIT
            
            
    PRINT:
        MOV AH, 2
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H
        
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
        
    
    EXIT:
        MOV AH, 4CH
        INT 21H
MAIN ENDP
END MAIN