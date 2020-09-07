assume cs:code,ds:data
data segment
	db 'BaSiC'
	db 'MinIX'
data ends

code segment

start:	mov ax,data
		mov ds,ax	

		mov bx,0	
		mov cx,5	

s:		mov al,[bx]			
		and al,11011111b	
		mov [bx],al	
		inc bx				
		loop s

		mov bx,5			
		mov cx,5		

s0:		mov al,[bx]
		or al,00100000b
		mov [bx],al
		inc bx
		loop s0
	
		mov ax,4C00H
		int 21H
code ends
end start