.model small
.stack 100
.data
    Tbao1   db  13, 10, 'Chuoi da nhap la: $'
    str     db  100 dup('$')  
.Code
Main Proc
    MOV AX, @Data
    MOV DS, AX
    
    MOV AH, 10  ; su dung ham ngat 10 de nhap string
    LEA DX, str
    INT 21H
    
    MOV AH, 9
    LEA DX, Tbao1
    INT 21H
    
    MOV AH, 9
    LEA DX, str + 2 ; byte 0 : 256 
    INT 21H         ; byte 1 : s.size()
                    ; byte 2 : string => can dung : str + 2 de in ra string     
    MOV AH, 4CH
    INT 21H
Main endp
END