assume cs:code

code segment

start: mov ax,cs
       mov ds,ax
       mov si,offset s

       mov ax,0
       mov es,ax
       mov di,200h

       mov cx,offset send-offset s
       cld
       rep movsb

       cli
       mov word ptr es:[7ch*4],200h
       mov word ptr es:[7ch*4+2],0
       sti

       mov ax,4c00h
       int 21h

s: jmp short set
    
table dw sub1-s+200h,sub2-s+200h,sub3-s+200h,sub4-s+200h

set: push bx
     push si
     cmp ah,3
     ja sret
     mov bl,ah
     mov bh,0
     add bx,bx
     
     mov si, table-s+200h     
     call word ptr cs:[si]
           
sret: pop si
      pop bx
      iret

 sub1: push bx
       push cx
       push es
       mov bx,0b800h
       mov es,bx
       mov bx,0
       mov cx,2000
sub1s: mov byte ptr es:[bx],' '
       add bx,2
       loop sub1s
       pop es
       pop cx
       pop bx
       ret
       
 sub2: push bx
       push cx
       push es
       mov bx,0b800h
       mov es,bx
       mov bx,1
       mov cx,2000
sub2s: mov dl,es:[bx]
       and dl,11111000b
       or dl,al
       mov byte ptr es:[bx],dl

       add bx,2
       loop sub2s
       
       pop es
       pop cx
       pop bx
       ret
       
 sub3: push bx
       push cx
       push es
       mov cl,4
       shl al,cl
       mov bx,0b800h
       mov es,bx
       mov bx,1
       mov cx,2000
sub3s: and byte ptr es:[bx],10001111b
       or es:[bx],al
       add bx,2
       loop sub3s
       pop es
       pop cx
       pop bx
       ret
       
 sub4: push cx
       push si
       push di
       push es
       push ds
       mov si,0b800h
       mov es,si
       mov ds,si
       mov si,160
       mov di,0
       cld
       mov cx,24
sub4s: push cx
       mov cx,160
       rep movsb
       pop cx
       loop sub4s
       
       mov cx,80
       mov si,0
sub4s1: mov byte ptr [160*24+si],' '
        add si,2
        loop sub4s1
        
        pop ds
        pop es
        pop di
        pop si
        pop cx
        ret

send: nop

code ends

end start
