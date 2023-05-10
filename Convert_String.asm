.Model Small
.Stack 100
.Data     
    str     db 256 dup('$')
    tbao1   db 'Hay nhap chuoi: $'
    CRLF    db 13, 10, '$'
    tbao2   db 'Chuoi in hoa: $'  
    tbao3   db 13, 10, 'Chuoi in thuong: $'
.Code
Main Proc                             
        MOV AX, @Data
        MOV DS, AX
        
        MOV AH, 9    
        LEA DX, tbao1
        INT 21H
        
        MOV AH, 10
        LEA DX, str
        INT 21H      
        
        ; xuong dong
        
        MOV AH, 9
        LEA DX, CRLF
        INT 21H
        
        ;in chuoi duoc xu ly
        
        MOV AH, 9
        LEA DX, tbao2
        INT 21H
        
        ;in hoa 
        CALL Uppercase 
        
        MOV AH, 9
        LEA DX, tbao3
        INT 21H     
        
        ;in thuong
        CALL Lowercase
          
        MOV AH, 4CH
        INT 21H
Main Endp

Uppercase proc
    LEA SI, str + 2
    Lap1:   
        MOV DL, [SI]
        CMP DL, '$'
        JE  break1
        CMP DL, 'a'
        JL  print1
        CMP DL, 'z'
        JG  print1
        
        SUB DL, 32
        
    print1:
        INC SI
        MOV AH, 2
        INT 21H
    Loop lap1
    break1:
RET
Uppercase Endp 

Lowercase proc
    LEA SI, str + 2
    Lap2:
        MOV DL, [SI]
        CMP DL, '$'
        JE break2:
        CMP DL, 'A'
        JL  print2
        CMP DL, 'Z'
        JG  print2
        
        ADD DL, 32
    print2:
        MOV AH, 2
        INT 21H
        
        INC SI
    Loop Lap2   
    break2:
RET
Lowercase Endp
                    
END
    