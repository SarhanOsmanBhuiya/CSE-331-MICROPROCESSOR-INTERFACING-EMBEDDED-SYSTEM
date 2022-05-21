ORG 100H
.MODEL SMALL
.STACK 100H
.DATA
    STR DB 50 DUP(?), '$'
.CODE

MAIN PROC  
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1 
    MOV CX, 0
    LEA SI, STR
    
    INPUT:
    INT 21H 
    MOV BL, AL
    
    CMP BL, 32
    JE REVERSE 
    
    CMP BL, 13
    JE REVERSE
   
    PUSH BX
    INC CX
    JMP INPUT
    
    REVERSE:   
    POP DX   
    MOV [SI], DL
    INC SI
    LOOP REVERSE
    
    MOV [SI], 32
    INC SI 
    
    CMP BL, 13
    JE DISPLAY
    
    JMP INPUT 
    
    DISPLAY:
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    MOV AH, 9
    LEA DX, STR
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN