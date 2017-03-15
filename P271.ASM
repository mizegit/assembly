assume cs:code
code segment
start: mov ax,0
       mov al,9
       mov si,0
       mov cx,6
       
    s: push cx
       push ax
       out 70h,al
       in al,71h
       mov ah,al
       mov cl,4
       shr ah,cl
       and al,00001111b
       add ah,30h
       add al,30h
       mov bx,0b800h
       mov es,bx
       mov byte ptr es:[160*12+40*2][si],ah
       mov byte ptr es:[160*12+40*2+2][si],al
       pop ax
       dec ax
       jmp s1
   s0: pop cx
       add si,6
       loop s
       
       mov ax,4c00h
       int 21h
   s1: cmp ax,10
       ja s0
       cmp ax,0
       je s0
       cmp ax,6
       ja s2
       je s3
       jb s4
   s2: mov byte ptr es:[160*12+40*2+4][si],'/'
       jmp s0
   s3: sub ax,2
       jmp s0
   s4: sub ax,1
       mov byte ptr es:[160*12+40*2+4][si],":"
       jmp s0
code ends
end start