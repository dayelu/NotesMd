assume cs:code
code segment
	mov ax,0ffffh
	mov ds,ax	; 设置(ds)=ffffh
	mov dx,0	; 初始化累加寄存器，(dx)=0

	mov al,ds:[0]
	mov ah,0	; (ax)=((ds)*16+0)=(ffff0h)
	add dx,ax	; 向dx中加上 ffff:0 单元的数值

	mov al,ds:[1]
	mov ah,0	; (ax)=((ds)*16+1)=(ffff1h)
	add dx,ax	; 向dx中加上 ffff:1 单元的数值

	mov al,ds:[2]
	mov ah,0	; (ax)=((ds)*16+2)=(ffff2h)
	add dx,ax	; 向dx中加上 ffff:2 单元的数值

	mov al,ds:[3]
	mov ah,0	; (ax)=((ds)*16+3)=(ffff3h)
	add dx,ax	; 向dx中加上 ffff:3 单元的数值

	mov al,ds:[4]
	mov ah,0	; (ax)=((ds)*16+4)=(ffff4h)
	add dx,ax	; 向dx中加上 ffff:4 单元的数值

	mov al,ds:[5]
	mov ah,0	; (ax)=((ds)*16+5)=(ffff5h)
	add dx,ax	; 向dx中加上 ffff:5 单元的数值


	mov al,ds:[6]
	mov ah,0	; (ax)=((ds)*16+6)=(ffff6h)
	add dx,ax	; 向dx中加上 ffff:6 单元的数值

	mov al,ds:[7]
	mov ah,0	; (ax)=((ds)*16+7)=(ffff7h)
	add dx,ax	; 向dx中加上 ffff:7 单元的数值

	mov al,ds:[8]
	mov ah,0	; (ax)=((ds)*16+8)=(ffff8h)
	add dx,ax	; 向dx中加上 ffff:8 单元的数值

	mov al,ds:[9]
	mov ah,0	; (ax)=((ds)*16+9)=(ffff9h)
	add dx,ax	; 向dx中加上 ffff:9 单元的数值

	mov al,ds:[0ah]
	mov ah,0	; (ax)=((ds)*16+0ah)=(ffffah)
	add dx,ax	; 向dx中加上 ffff:a 单元的数值

	mov al,ds:[0bh]
	mov ah,0	; (ax)=((ds)*16+0bh)=(ffffbh)
	add dx,ax	; 向dx中加上 ffff:b 单元的数值

	mov ax,4c00h
	int 21h		; 程序返回

code ends
end