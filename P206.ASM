assume cs:code
data segment
    db 'Welcome to masm',0
data ends

code segment
    start: mov dh,8
           mov dl,3
           mov cl,2
           mov ax,data
           mov ds,ax
           mov si,0
           call show_str
           
           mov ax,4c00h
           int 21h
           
 show_str: push es
           push dx
           push cx
           push ax
           push bx
           push si
           push di
           
           mov ax,0b800h
           mov es,ax
           
           mov al,0A0h
           inc dh
           mul dh
           mov bx,ax
           
           mov al,2
           inc dh
           mul dl
           add ax,bx
           
           mov bx,ax
           
           mov ah,cl
        
        l: mov al,ds:[si]
           mov es:[bx+di],al
           mov es:[bx+di+1],ah
           add si,1
           add di,2
           
           mov cl,ds:[si]
           mov ch,0
           jcxz r
           loop l
           
        r: pop di 
           pop si
           pop bx
           pop ax
           pop cx
           pop dx
           pop es
           ret
code ends
end start

