assume cs:codesg

codesg segment	;定义一个段名为 codesg 的段，从此开始

	mov ax,0ffffh
	mov ds,ax
	mov bx,0	; 初始化 ds:bx 指向 ffff:0

	mov dx,0	; 初始化累加器 dx
	mov cx,12	; 初始化训话计数器 cx
	
s:	mov al,[bx]
	mov ah,0
	add dx,ax
	inc bx		; bx 自增，指向下一个内存单元
	loop s
	
	mov ax,4c00h
	int 21h

codesg ends	;名为 codesg 的段到此结束

end