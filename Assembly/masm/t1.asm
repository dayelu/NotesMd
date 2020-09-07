assume cs:codesg

codesg segment	;定义一个段名为 codesg 的段，从此开始

	mov ax,2000H
	mov ss,ax
	mov sp,0
	add sp,10

	pop ax
	pop bx
	push ax 
	push bx
	pop ax
	pop bx
	
	mov ax,4c00H
	int 21H

codesg ends	;名为 codesg 的段到此结束

end