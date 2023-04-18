.model small
.stack 100
.data
    Tbao1   db 'Hay go ky tu ma ban can chuyen : $'
    CRLF    db 13, 10, '$'
    Char    db ?,'$'
    Tbao2   db 'Ky tu duoc chuyen doi la: $'

.code
Main Proc
        MOV AX, @Data
        MOV DS, AX
               
        MOV AH, 9
        LEA DX, Tbao1
        INT 21H
        
        MOV AH, 1
        INT 21H
        SUB al, 20H
        MOV Char, al
        
        MOV AH, 9
        LEA DX, CRLF
        INT 21H    
        
        MOV AH, 9
        LEA DX, Tbao2
        INT 21H
        
        MOV AH, 2
        MOV dl, Char
        INT 21H       
    
        MOV AH, 4CH
        INT 21H
Main Endp
END