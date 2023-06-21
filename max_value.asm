.Model Small
.Stack 100
.Data
        list    db 1, 2, 3, 4, 5, 6, 7, 8, 9
.Code
Main Proc
        MOV AX, @Data
        MOV DS, AX
        
        MOV CX, 9
        LEA SI, list    ;pointer -> first value of list
        MOV BL, [SI]    ;BL <- list[0]
        INC SI          ;si++
    Start:               
        lodsb           ;auto al <- si & si++
        CMP BL, AL
        JGE BYPASS
        MOV BL, AL
    BYPASS:       
        Loop Start
        
        ADD BL, '0'     ;convert interger into text in order to print
        MOV DL, BL
        MOV AH, 2
        INT 21H
        
        MOV AH, 4CH
        INT 21H
Main endp
END