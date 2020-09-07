assume CS:code,DS:data,SS:stack
data segment
	DW 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
data ends

stack segment
	DW 0,0,0,0,0,0,0,0
stack ends

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
end start
