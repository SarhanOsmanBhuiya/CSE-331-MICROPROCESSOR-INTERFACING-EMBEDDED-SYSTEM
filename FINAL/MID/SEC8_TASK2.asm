ORG 100H

.DATA 
    MSG1 DB "Enter a Hex digit: $"
    MSG2 DB " The decimal value is: $" 
    MSG3 DB "Illegal character input.$"
    MSG4 DB "Do you want to repeat the program?$"
   
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
        JA CHECK_a_Tof
        
        JMP CONVERT
        
    CHECK_1TO9:
        CMP BL, 30H
        JB ILLEGAL
        
        CMP BL, 39H
        JA ILLEGAL
        
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
        
        MOV AH, 2
        MOV DL, BL
        INT 21H 
        
        JMP REPEAT 
        
    CHECK_a_Tof:
        CMP BL, 61H
        JB ILLEGAL
        
        CMP BL, 66H
        JA ILLEGAL
        
        JMP CONVERT_LOWERCASE
        
        
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
        JMP REPEAT 
    
    CONVERT_LOWERCASE:
        SUB BL, 31H
        
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
                
        MOV AH, 2
        MOV DL, 31H
        INT 21H
        
        MOV DL, BL
        INT 21H 
        JMP REPEAT
                
    
    ILLEGAL:
        LEA DX, MSG3
        MOV AH, 9
        INT 21H
        
        MOV AH, 4CH
        INT 21H
    
        
    REPEAT:
        MOV AH, 2
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H
         
        LEA DX, MSG4
        MOV AH, 9
        INT 21H
        
        MOV AH, 1
        INT 21H 
        MOV CL, AL
        
        CMP CL, 'Y'
        MOV AH, 2
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H 
        JE INPUT 
        
        CMP CL, 'y'
        JE INPUT
        
        JMP EXIT
        
    EXIT:
        MOV AH, 4CH
        INT 21H
        
MAIN ENDP
END MAIN