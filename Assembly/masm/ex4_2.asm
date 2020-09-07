assume CS:code
code segment
	MOV AX,0020h
	MOV DS,AX
	MOV bx,0
	MOV CX,64

s:	MOV [bx],bx
	INC bx
	LOOP s

	MOV AX,4c00h
	INT 21h

code ends
end