ORG 100H
.DATA
    STR DB "HiLLL WYRLD$"
    VOW DB "AEIOUaeiou$"
    MSG1 DB "VOWEL FOUND$" 
    MSG2 DB "VOWEL NOT FOUND$" 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV ES, AX
    
    CLD
    MOV BX, 0
    
    VOWEL:
        CMP VOW[BX], '$'
        JE DISPLAY_N
        
                   
        LEA DI, STR
        MOV AL, VOW[BX]
        INC BX
        MOV CX, 11
        
    SCAN:
        REPNE SCASB
        JNE VOWEL
    
    DISPLAY:
        MOV AH, 9
        LEA DX, MSG1
        INT 21H
        
        JMP EXIT
        
    DISPLAY_N:
        MOV AH, 9
        LEA DX, MSG2
        INT 21H 
        
        JMP EXIT
        
    EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN