ORG 100H
.DATA
    STR DB "HELLO WORLD$"
    VOW DB "AEIOUaeiou$"
    MSG1 DB "VOWELS FOUND$" 
    MSG2 DB "VOWEL NOT FOUND$"
    MSG3 DB "VOWEL FOUND$" 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV ES, AX
    
    CLD
    LEA SI, VOW
    ;MOV BX, 0 
    XOR BX, BX
    
    VOWEL:
        CMP [SI], '$'
        ;JE DISPLAY_N 
        JE DISPLAY
        
                   
        LEA DI, STR
        MOV AL, [SI]
        INC SI
        MOV CX, 11
        
    SCAN:
        REPNE SCASB
        JNE VOWEL
        
        INC BL      ;increment bl if equal
        JMP VOWEL
    
    DISPLAY:
        CMP BL, 0
        JE DISPLAY_N ;no vowel found
        
        CMP BL, 1
        JE DISPLAY_1 ;1 vowel found
        
        ;below is the code for more than one vowels found
        
        MOV AH, 2
        MOV DL, BL
        ADD DL, 30H
        INT 21H
        MOV DL, 32
        INT 21H
        
        MOV AH, 9
        LEA DX, MSG1
        INT 21H
        
        JMP EXIT
        
    DISPLAY_N:      ;no vowel
        MOV AH, 9
        LEA DX, MSG2
        INT 21H 
        
        JMP EXIT    
        
    DISPLAY_1:      ;1 vowel
        MOV AH, 2
        MOV DL, 31
        INT 21H
        MOV DL, 32
        INT 21H
        
        MOV AH, 9
        LEA DX, MSG3
        INT 21H
        
    EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN