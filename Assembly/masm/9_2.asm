assume CS:code,DS:data,SS:stack
data segment
	DW 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
data ends

stack segment
	DW 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stack ends

code segment
start:	MOV AX,stack
	MOV SS,AX
	MOV SP,20h	; 设置栈顶 ss:sp 指向 stack:20h

	MOV AX,data
	MOV DS,AX	; ds 指向 data 段

	MOV bx,0	; ds:bx 指向 data 段中段第一个单元
	MOV CX,8
s:	PUSH [bx]
	ADD bx,2
	LOOP s		; 将以上 data 段中段 0~15 单元
			; 中的 8 个字型数据依次入栈

	MOV bx,0
	MOV CX,8
s0:	POP [bx]
	ADD bx,2
	LOOP s0		; 以上依次出栈 8 个字型数据到 
			; data 段的 0~15 单元中
	MOV AX,4c00h
	INT 21h

code ends
end start
	