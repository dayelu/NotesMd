assume cs:codesg

codesg segment	;定义一个段名为 codesg 的段，从此开始

	mov ax,0123H
	mov bx,0456H
	add ax,bx
	add ax,ax
	
	mov ax,4c00H
	int 21H

codesg ends	;名为 codesg 的段到此结束

end