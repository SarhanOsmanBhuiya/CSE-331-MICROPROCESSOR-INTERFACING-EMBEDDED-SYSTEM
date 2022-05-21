ORG 100H
.DATA            

    STR1 DB "HELLO CLASS!$"
    STR2 DB 15 DUP(?), '$' 
    MSG1 DB "String is pallindrome!$" 
    MSG2 DB "String is not pallindrome!$"
    MSG3 DB "ENTERED STRING=$"
    MSG4 DB "REVERSE STRING=$" 
    
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
        LEA DX, MSG3 
        INT 21H
     
        MOV AH, 9
        LEA DX, STR1 
        INT 21H 
        
        MOV AH,2
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        
        MOV AH, 9
        LEA DX, MSG4 
        INT 21H
        
        MOV AH, 9
        LEA DX, STR2 
        INT 21H 
        
        MOV AH,2
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
        
    COMPARE_PALINDROME:
        
        CLD
        LEA SI,STR1
        LEA DI,STR2
        MOV CX,12 
        
        REPE CMPSB
        JNE PRINT_N
        
    PRINT:
        
        MOV AH, 9
        LEA DX, MSG1 
        INT 21H     
        JMP EXIT 
        
    PRINT_N:
        
        MOV AH, 9
        LEA DX, MSG2 
        INT 21H     
        JMP EXIT
        
        
    EXIT:
        MOV AH, 4CH
        INT 21H
        
MAIN ENDP
END MAIN