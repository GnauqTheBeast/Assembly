.Model Small
.Stack 100
.Data
        str     db  256 dup('$')
.Code

Main Proc
        MOV AX, @Data
        MOV DS, AX
        
        MOV AH, 10
        LEA DX, str
        INT 21H
                  
        MOV BX, 10
        MOV AX, 0           
        MOV AL, str + 1   
        MOV CX, 0
        
    LOOPING_1:
        MOV DX, 0
        DIV BX
        PUSH DX      
        INC CX
        CMP AX, 0
        JNZ LOOPING_1   
        
    LOOPING_2:
        POP DX
        ADD DL, '0'    
        MOV AH, 2
        INT 21H
        LOOP LOOPING_2
        
        MOV AH, 4CH
        INT 21H
Main Endp
END