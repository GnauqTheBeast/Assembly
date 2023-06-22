.Model Small
.Stack 100
.Data
    PORT EQU 2C0H
.Code
Main Proc
        MOV AX, @Data
        MOV DS, AX
        
    Start:
        IN AL, 125 
        MOV CX, 200
        CMP AL, 70
        JL  TurnOn
        CMP AL, 100
        JG  TurnOff
        JMP Start
        
    TurnOn: 
        MOV AL, 1
        OUT 127, AL
        JMP Delay
        
        
    TurnOff:
        MOV AL, 0
        OUT 127, AL
        JMP Delay
        
    Delay: NOP
        Loop Delay
        JMP Start
        
        MOV AH, 4CH
        INT 21H
Main Endp
END