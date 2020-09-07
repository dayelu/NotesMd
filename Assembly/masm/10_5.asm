assume cs:code,ds:data
data segment
	db 'ibm             '	; 每个字符串长度都为 16，以空格补缺
	db 'dec             '
	db 'dos             '
	db 'vax             '
data ends

code segment

start:	mov ax,data
		mov ds,ax	

		mov bx,0	
		mov cx,4

s0:		mov dx,cx		; 将外层循环 cx 的值保存在 dx 中
		mov si,0
		mov cx,3

s:		mov al,[bx+si]
		and al,11011111b
		mov [bx+si],al
		inc si
		loop s

		add bx,16
		mov cx,dx
		loop s0		; 外层循环 loop 指令将 cx 中的计数值减一

		mov ax,4C00H
		int 21H
code ends
end start