assume cs:code,ds:data,ss:stack
stack segment
	dw 0,0,0,0,0,0,0,0
stack ends

data segment
	db '1. dispaly      '		; 每个字符串长度都为 16，空格补缺
	db '2. brows        '		; 小数点与 单词之间用一个空格隔开
	db '3. replace      '
	db '4. modify       '
data ends

code segment

start:	mov ax,stack
		mov ss,ax
		mov sp,16
		
		mov ax,data
		mov ds,ax
		mov bx,0

		mov cx,4

s0:		push cx		; 将外层循环 cx 的值压栈
		mov si,0
		mov cx,4

s:		mov al,[3+bx+si]
		and al,11011111b
		mov [3+bx+si],al
		inc si
		loop s

		add bx,16
		pop cx		; 从栈顶弹出原 cx 的值，恢复 cx
		loop s0		; 外层循环 loop 指令将 cx 中的计数值减一

		mov ax,4C00H
		int 21H
code ends
end start