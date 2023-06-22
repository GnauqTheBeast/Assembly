.Model Small
.Stack 100
.Data
    tbao1   db  'Hay nhap xau: $'
    tbao2   db  13, 10, 'Xau in nguoc la: $'
    CRLF    db  13, 10, '$'
.Code
Main Proc
        MOV AX, @Data
        MOV DS, AX   ;ktao thanh ghi DS
        
        MOV AH, 9
        LEA DX, tbao1
        INT 21H
        
        MOV AH, 9
        LEA DX, CRLF
        INT 21H
          `
        MOV CX, 0
    Lap:
        MOV AH, 1
        INT 21H  
        INC CX
        CMP AL, '#'
        JE Break
        PUSH AX
        JMP Lap   
        
    Break:
        
        MOV AH, 9
        LEA DX, tbao2
        INT 21H
                   
        MOV AH, 9
        LEA DX, CRLF
        INT 21H
        
    Lap2:
        POP DX
        MOV AH, 2
        INT 21H
        LOOP Lap2     
        
        MOV AH, 4CH
        INT 21H
Main Endp
END
        