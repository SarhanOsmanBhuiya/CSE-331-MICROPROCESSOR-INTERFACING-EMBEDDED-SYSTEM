ORG 100H

.DATA 
    MSG1 DB "Enter a Hex digit: $"
    MSG2 DB " The decimal value is: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    INPUT:
        MOV AH, 9
        LEA DX, MSG1
        INT 21H 
        
        MOV AH, 1
        INT 21H
        MOV BL, AL
    
    NEWLINE:
        MOV AH, 2
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H 
       
    
    CHECK_ATOF:
        CMP BL, 41H
        JB CHECK_1TO9
        
        CMP BL, 46H
        JA EXIT
        
        JMP CONVERT
        
    CHECK_1TO9:
        CMP BL, 30H
        JB EXIT
        
        CMP BL, 39H
        JA EXIT
        
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
        
        MOV AH, 2
        MOV DL, BL
        INT 21H 
        
        JMP EXIT
        
    CONVERT:
        SUB BL, 11H
        
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
                
        MOV AH, 2
        MOV DL, 31H
        INT 21H
        
        MOV DL, BL
        INT 21H 
        JMP EXIT
        
        
    EXIT:
        
        MOV AH, 4CH
        INT 21H  
        
MAIN ENDP
END MAIN