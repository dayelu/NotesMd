assume CS:code,DS:data,SS:stack

code segment
start:	MOV AX,stack
	MOV SS,AX
	MOV SP,16

	MOV AX,data
	MOV DS,AX

	PUSH DS:[0]
	PUSH DS:[2]

	POP DS:[2]
	POP DS:[0]

	MOV AX,4C00H
	INT 21H

code ends

data segment
	DW 0123h,0456h
data ends

stack segment
	DW 0,0
stack ends

end ;start
