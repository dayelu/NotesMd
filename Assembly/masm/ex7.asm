assume CS:code

data segment
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
	db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
	db '1993','1994','1995'
	; 以上是表示 21 年的字符串
	
	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
    ;以上是表示21年公司总收入的21个dword型数据
    
    dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,15257,17800
    ;以上是表示21年公司雇员人数的21个word型数据
data ends

table segment
	db 21 dup ('year summ ne ?? ')
table ends

code segment
	
start:		mov ax,data
		mov ds,ax

		mov ax,table
		mov es,ax

		mov bx,0
		MOV DI,0
		mov si,0
		mov cx,21

s:		mov ax,ds:[bx]
		mov es:[si],ax
		mov ax,ds:[2+bx]
		mov es:[2+si],ax		; 0~3 列，年份

		mov BYTE ptr es:[4+si],' '	; 4 列，空格

		mov ax,ds:[54h+bx]
		mov es:[5+si],ax
		mov dx,ds:[56h+bx]
		mov es:[7+si],dx		; 5~8 列，被除数，收入	

		div WORD ptr ds:[0a8h+di]
		mov es:[0dh+si],ax		; d~e 列，商，人均收入取整

		mov BYTE ptr es:[9+si],' '	; 9 列，空格

		mov ax,ds:[0a8h+di]
		mov es:[0ah+si],ax		; a~b 除数，雇员

		MOV BYTE ptr es:[0ch+si],' '	; c 列，空格

		MOV BYTE ptr es:[0fh+si],' '	; f 列，空格
		
		ADD DI,2
		ADD bx,4
		add si,10h

		loop s

		MOV AX,4C00H
		INT 21H

code ends
end start