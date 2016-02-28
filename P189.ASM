assume cs:codesg

codesg segment
      start: mov ax,0b800h
             mov ds,ax
             
             mov cx,5
             mov bx,0
             mov al,41h
          
          s: mov byte ptr ds:[bx+1],0cah
             mov ds:[bx],al
             
             inc al
             add bx,2
             loop s
             
             mov ax,4c00h
             int 21h
codesg ends

end start
