assume cs:code, ds:data

datar segment
        db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
        db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
        db '1993','1994','1995'

        dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
        dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000

        dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
        dw 11542,14430,15257,17800
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
          mov bx,0
          mov cx,21
          mov dh,1
          
       s: mov ax,es:[si]     ;;;year
          mov ds:[0],ax

          mov ax,es:[2+si]
          mov ds:[2],ax
          mov ds:[4],0
          
          push cx
          mov dl,7
          mov cl,2
          call show_str
          pop cx

          push dx            ;;;money
          mov ax,es:[54h+si] 
          mov dx,es:[56h+si]
          call dtoc
          pop dx
          
          push cx
          mov cl,2
          mov dl,17
          call show_str
          pop cx

          push dx            ;;;people num
          mov ax,es:[0a8h+di]
          mov dx,0
          call dtoc
          pop dx

          push cx
          mov cl,2
          mov dl,27
          call show_str
          pop cx
          
          push dx           ;;; div money by people
          mov ax,es:[54h+si]
          mov dx,es:[56h+si]
          div word ptr es:[0a8h+di]
          mov dx,0
          call dtoc
          pop dx

          push cx
          mov cl,2
          mov dl,37
          call show_str
          pop cx

          inc dh
          add si,4
          add di,2

          loop s

          mov ax,4c00h
          int 21h

    dtoc: push cx
          push di
          push si
          mov si,0
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
