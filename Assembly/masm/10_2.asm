assume cs:code,ds:data
data segment
	db 'BaSiC'
	db 'iNfOrMaTiOn'
data ends

code segment

start:	mov ax,data
		mov ds,ax	; ���� ds ָ�� data ��

		mov bx,0	; ���� (bx) = 0, bx ָ�� 'BaSiC' �ĵ�һ����ĸ
		mov cx,5	; ����ѭ������ 5, ��Ϊ 'BaSiC' �������ĸ

s:		mov al,[bx]			; �� ASCII ��� ds:bx ��ָ��ĵ�Ԫȡ��
		and al,11011111B	; �� al �е� ASCII ��ĵ���λ���㣬��ɴ�д��ĸ
		mov [bx],al			; ��ת����� ASCII ��д��Դ��Ԫ
		inc bx				; (bx) ��һ�� ds:bx ָ����һ����ĸ
		loop s

		mov bx,5			; ���� (bx) = 5, ds:bx ָ�� 'iNfOrMaTiOn' �ĵ�һ����ĸ
		mov cx,11			; ����ѭ������ 11����Ϊ 'iNfOrMaTiOn' ��ʮһ����ĸ

s0:		mov al,[bx]
		or al,00100000B		;�� al �е� ASCII ��ĵ���λ���㣬���Сд��ĸ
		mov [bx],al
		inc bx
		loop s0
	
		mov ax,4C00H
		int 21H
code ends
end start