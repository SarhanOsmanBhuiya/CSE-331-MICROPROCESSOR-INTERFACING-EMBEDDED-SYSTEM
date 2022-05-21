ADD two array and print in different array!


org 100h
.MODEL SMALL
.STACK 100H
.DATA

    ARR1 DB 31H,32H,33H,34H,35H
    ARR2 DB 35H,34H,33H,32H,31H
    ARR3 DB DUP 5 (?)
    
    MSG DB "SUM ARRAY:$"
         
.CODE
    MAIN PROC 
       MOV AX,@DATA
       MOV DS,AX
       
       MOV AH,9
       LEA DX,MSG
       INT 21H
        
       MOV SI,0
       MOV CX,5
       
       PRINT:
       MOV BL,ARR1[SI]
       MOV BH,ARR2[SI]
       ADD BL,BH
       MOV ARR3[SI],BL
       SUB ARR3[SI],30H 
       
       MOV AH,2
       MOV DL,ARR3[SI]
       INT 21H  
       
       INC SI
       LOOP PRINT
       
       

ret




