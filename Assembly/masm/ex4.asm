assume CS:code
code segment
	MOV AX,___
	MOV DS,AX
	MOV AX,0020h
	MOV ES,AX
	MOV bx,0
	MOV CX,___

s:	MOV AL,[bx]
	MOV ES:[bx],AL
	INC bx
	LOOP s

	MOV AX,4c00h
	INT 21h

code ends
end
	