assume cs:code
code segment
time db 'yy/mm/dd hh:mm:ss','$'
cmos db 9,8,7,4,2,0
start: mov ax,cs
       mov ds,ax
       mov bx,0
       mov si,0
       mov cx,6
    a: push cx
       mov al,cmos[bx]
       out 70h,al
       in al,71h
       mov ah,al
       mov cl,4
       shr al,cl
       and ah,0fh
       add ax,3030h
       mov cs:[si],ax
       inc bx
       add si,3
       pop cx
       loop a
       
       mov ah,2
       mov bh,0
       mov dh,13
       mov dl,32
       int 10h
       
       mov dx,0
       mov ah,9
       int 21h
       
       mov ax,4c00h
       int 21h
code ends
end start
