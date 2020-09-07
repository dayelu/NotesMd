assume CS:code,DS:data
data segment
	DB 'Unix'
	DB 'foRK'
data ends

code segment

start:	MOV AL,'a'
	MOV BL,'b'
	MOV AX,4C00H
	INT 21H
code ends
end start