assume cs:code,ds:data
data segment
	db 'BaSiC'
	db 'iNfOrMaTiOn'
data ends

code segment

start:	mov ax,data
		mov ds,ax	; 设置 ds 指向 data 段

		mov bx,0	; 设置 (bx) = 0, bx 指向 'BaSiC' 的第一个字母
		mov cx,5	; 设置循环次数 5, 因为 'BaSiC' 有五个字母

s:		mov al,[bx]			; 将 ASCII 码从 ds:bx 所指向的单元取出
		and al,11011111B	; 将 al 中的 ASCII 码的第六位置零，变成大写字母
		mov [bx],al			; 将转化后的 ASCII 码写回源单元
		inc bx				; (bx) 加一， ds:bx 指向下一个字母
		loop s

		mov bx,5			; 设置 (bx) = 5, ds:bx 指向 'iNfOrMaTiOn' 的第一个字母
		mov cx,11			; 设置循环次数 11，因为 'iNfOrMaTiOn' 有十一个字母

s0:		mov al,[bx]
		or al,00100000B		;将 al 中的 ASCII 码的第六位置零，变成小写字母
		mov [bx],al
		inc bx
		loop s0
	
		mov ax,4C00H
		int 21H
code ends
end start