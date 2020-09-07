assume CS:codesg
codesg segment
	DW 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
	DW 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		; 用 dw 定义 16 个字型数据，在程序加载之后，将取得 16 个字的
		; 内存空间，存放这 16 个数据。在后面的程序中将这段
		; 空间当做栈来使用

start:	MOV AX,CS
	MOV SS,AX
	MOV sp,30h	; 将设置栈顶 ss:sp 指向 cs:30h

	MOV bx,0
	MOV CX,8

s:	PUSH CS:[bx]
	ADD bx,2
	LOOP s		; 以上将代码段 0~15 单元中的 8 个字型数据依次入栈

	MOV bx,0
	MOV CX,8

s0:	POP CS:[bx]
	ADD bx,2
	LOOP s0		; 以上依次出栈 8 个字型数据到代码段 0~15 单元中

	MOV AX,4c00h
	INT 21h

codesg ends
end start
	