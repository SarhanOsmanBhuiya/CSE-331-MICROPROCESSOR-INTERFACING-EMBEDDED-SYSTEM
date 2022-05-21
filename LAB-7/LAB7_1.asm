.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter the string : $'
   PROMPT_2  DB  0DH,0AH,'The string with words in reverse order : $'

   COUNT     DW  0

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H

     XOR CX, CX                   
     MOV AH, 1                    

     @INPUT:                      
       INT 21H                  

       CMP AL, 0DH               
       JE NL             

       PUSH AX                    
       INC CX                     
     JMP @INPUT                   

    
    
       LEA DX, PROMPT_2            
     MOV AH, 9
     INT 21H
    
        
NL: 
MOV AH,2
MOV DL,10
INT 21H
MOV DL,13
INT 21H
    
    
    
     REVERSE:                  
          MOV AH,2
          POP DX
          INT 21H
          LOOP REVERSE
          
            
            
            EXIT:
    MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN