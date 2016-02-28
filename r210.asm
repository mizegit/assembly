assume cs:code, ds:data

datar segment
    dd 1,22,333,4444,55555,6,7,8,9
datar ends

data segment
    db 20 dup (0)
data ends

code segment
   start: mov bx,data
          mov ds,bx

          mov bx,datar
          mov es,bx

          mov di,0
          mov si,0
          mov cx,5
          mov dl,1        
          mov dh,1
       s: push dx
          mov ax,es:[di]  
          mov dx,es:[di+2]
          add di,4
          call dtoc
          pop dx 
          
          push cx
          mov cl,2
          call show_str
          pop cx
          add dl,10
          loop s
          

          mov ax,4c00h
          int 21h

    dtoc: push cx
          push di
          push si
          mov cx,0
          mov di,0
   dtoc1: mov bx,10
          call divdw
          add bx,30h
          push bx
          inc di
          mov cx,dx
          jcxz dxz
      jx: jmp dtoc1
     dxz: mov cx,ax
          jcxz allz
          jmp jx
    allz: mov cx,di
      zl: pop bx
          mov ds:[si],bl
          inc si
          loop zl
          mov ds:[si],0
          pop si
          pop di
          pop cx
          ret

   divdw: push cx
          mov cx,ax
          mov ax,dx
          mov dx,0
          div bx
          push ax
           
          mov ax,cx
          div bx
          mov bx,dx
          pop dx
          pop cx
          ret

show_str: push es
          push dx
          push cx
          push ax
          push bx
          push si
          push di
          
          mov si,0
          mov di,0
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
