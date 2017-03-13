assume cs:code

code segment
	start: mov ax,cs
	   mov ds,ax
		   mov si,offset show
		   mov ax,0
		   mov es,ax
		   mov di,200h
		   mov cx,offset showend-offset show
		   cld
		   rep movsb

		   mov ax,0
		   mov es,ax
		   mov word ptr es:[7ch*4],200h
		   mov word ptr es:[7ch*4+2],0
		   
		   mov ax,4c00h
		   int 21h

	show:  push ax
		   push bx
		   push es
		   push si
		   
		   mov ax,0b800h
		   mov es,ax
		   
		   mov al,160
		   mul dh
		   mov bx,ax
		   mov ax,2
		   mul dl
		   add bx,ax

		   mov al,cl
		   mov ch,0
	       lp: mov cl,ds:[si]
		   jcxz over
		   mov es:[bx],cl
		   mov es:[bx].1,al
		   add bx,2
		   add si,1
		   jmp lp
	over:  pop si
		   pop es
		   pop bx
		   pop ax
		   iret
		   mov ax,4c00h
		   int 21h
 showend:  nop
code ends
end start
