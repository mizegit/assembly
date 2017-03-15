assume cs:code

data segment
    db 10 dup ('s')
data ends

code segment
   start: mov ax,12666
          mov bx,data
          mov ds,bx
          mov si,0
          call dtoc
          
          mov dh,8
          mov dl,3
          mov cl,2
          call show_str

          mov ax,4c00h
          int 21h

    
    dtoc: push dx
          push cx
          push di
          mov di,0

     ds0: mov dx,0
          mov cx,10
          div cx
          add dl,30h
          push dx
          inc si
          
          mov cx,ax
          jcxz ds1
          jmp ds0

     ds1: pop cx
          mov ds:[di],cl
          inc di
          dec si
          mov cx,si
          jcxz dsok
          jmp ds1

    dsok: pop di
          pop cx
          pop dx
          ret

 
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
          jmp l
          
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
