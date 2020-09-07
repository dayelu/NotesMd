assume CS:code
a segment
	DB 1,2,3,4,5,6,7,8
a ends

b segment
	DB 1,2,3,4,5,6,7,8
b ends

c segment
	DB 0,0,0,0,0,0,0,0
c ends

code segment

start:	SUB bx,bx
	MOV CX,8
	
s:	MOV AX,a
	MOV DS,AX
	SUB DX,DX
	MOV DL,DS:[bx]

	MOV AX,b
	MOV DS,AX
	SUB AX,AX
	MOV AL,DS:[bx]
	ADD DX,	AX

	MOV AX,c
	MOV DS,AX
	MOV DS:[bx],DL

	INC bx
	LOOP s

	MOV AX,4C00H
	INT 21H

code ends
end start