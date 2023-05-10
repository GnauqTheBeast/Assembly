.Model Small
.Stack 100
.Data 
    str     db 50 dup('$')   ;If byte is greater than 50, remember to clear CX (CH != 0)
    Text    db 13, 10, 'The Reverse String: $'
.Code
Main Proc                              
        MOV AX, @Data
        MOV DS, AX
        
        ;Typed string
        MOV AH, 10
        LEA DX, str
        INT 21H
        
        MOV CL, str + 1 ;cx = s.size()
        LEA SI, str + 2 
        
        Looping:
            PUSH [SI]
            INC SI
            Loop Looping 
            
        MOV AH, 9
        LEA DX, Text
        INT 21H
        
        MOV CL, str + 1 
        Looping2:
            POP DX
            MOV AH, 2
            INT 21H
            Loop Looping2
        
        MOV AH, 4CH
        INT 21H
Main Endp
    