assume cs:code

code segment
	start: mov ax,234
           mov dx,1
           mov cx,10
           call divdw

           mov ax,4c00h
           int 21h

    divdw: mov bx,ax
           mov ax,dx
           mov dx,0
           div cx
           push ax
           
           mov ax,bx
           div cx
           mov cx,dx
           pop dx
           ret
code ends

end start
