assume CS:code
a segment
	DW 1,2,3,4,5,6,7,8,9,0ah,0bh,0ch,0dh,0eh,0fh,0ffh
a ends

b segment
	DW 0,0,0,0,0,0,0,0
b ends

code segment

start:	MOV AX,a
	MOV DS,AX
	SUB bx,bx
	MOV CX,8

	MOV AX,b
	MOV SS,AX
	MOV sp,10h

s:	PUSH [bx]
	ADD bx,2
	LOOP s

	MOV AX,4C00H
	INT 21H

code ends
end start