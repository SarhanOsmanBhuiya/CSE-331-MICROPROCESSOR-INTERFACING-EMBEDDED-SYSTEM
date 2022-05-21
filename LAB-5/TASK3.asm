ORG 100H
.DATA
    MSG DB "THIS IS CSE331 LAB CLASS 5$"
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV BX, 0
    
    CHECK:
        CMP MSG[BX],'$'
        JE DISPLAY
        
        CMP MSG[BX], 41H
        JAE CHECK2
        INC BX
        JMP CHECK
        
    CHECK2:
        CMP MSG[BX], 5AH
        JBE CONVERT 
        INC BX
        JMP CHECK
      
    CONVERT:
        ADD MSG[BX], 20H
        INC BX
        JMP CHECK
    
    DISPLAY:
        MOV AH, 9
        LEA DX, MSG
        INT 21H
    
    EXIT:
        MOV AH, 4CH
        INT 21H
MAIN ENDP
END MAIN