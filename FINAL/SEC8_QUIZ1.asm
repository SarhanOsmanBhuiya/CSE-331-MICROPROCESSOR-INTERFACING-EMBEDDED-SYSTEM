Array take in reverse order then sum the reversed arder array!


ORG 100H
.MODEL SMALL
.STACK 100H
.DATA
    ARRAY1 DB 31H, 33H, 32H, 33H,'$'
    ARRAY2 DB ?,?,?,?,'$' 
    MSG1 DB "ARRAY1: $"
    MSG2 DB "ARRAY2: $"
    MSG3 DB "SUM: $"
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
                  
        LEA SI, ARRAY1 
        LEA DI, ARRAY2
        
        MOV BL, [SI]
        MOV [DI+3], BL
        
        MOV BL, [SI+1]
        MOV [DI+2], BL

        MOV BL, [SI+2]
        MOV [DI+1], BL
        
        MOV BL, [SI+3]
        MOV [DI], BL
        
        LEA DX, MSG1
        MOV AH,9
        INT 21H
         
        LEA DX, ARRAY1
        INT 21H
        
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H       
        
        LEA DX, MSG2
        MOV AH,9
        INT 21H    
        
        LEA DX, ARRAY2
        INT 21H
        
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H 
        
        LEA DX, MSG3
        MOV AH,9
        INT 21H 
        
        MOV AH, 2
        
        MOV DL, ARRAY2[0]

        ADD DL, ARRAY2[1]
        SUB DL, 30H
        INT 21H
        
        MOV DL, ARRAY2[1] 
        ADD DL, ARRAY2[2]
        SUB DL, 30H
        INT 21H
        
        MOV DL, ARRAY2[2]
        ADD DL, ARRAY2[3]
        SUB DL, 30H
        INT 21H
        
        
        MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
END MAIN    