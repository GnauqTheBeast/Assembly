.Model Small
.Stack 100
.Data ;cac dong duoi Data la khai bao
        CRLF    DB 13, 10, '$'
        Hello DB 'hello world $'
.Code
MAIN Proc              
        ;Khoi tao DS
        MOV AX, @Data ; khoi dau thanh ghi DS
        MOV DS, AX    ; tro thanh ghi ve dau doan data            
              
        MOV AH, 9     ; ham interupt 9 de in ra cau lenh xuong dong
        LEA DX, CRLF
        INT 21H                                       
        
        MOV AH, 9     ; lenh goi ham 9 ca ngat 21 in 1 xau ki tu
        LEA DX, Hello
        INT 21H 
        
        MOV AH, 4CH   ; tro ve DOS dung ham 4CH cua INT 21H
        INT 21H

MAIN ENDp
END
                                   
                                  