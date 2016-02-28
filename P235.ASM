assume cs:codesg

datasg segment
   db "Beiginning's All-purpose Symbolic Instruction Code.",0
datasg ends

codesg segment
   begin: mov ax,datasg
          mov ds,ax
          mov si,0
          call letterc

          mov ax,4c00h
          int 21h

 letterc: push si
          push ax
       l: mov al,ds:[si]
          cmp al,0h
          je b

          cmp al,01100001b
          jb a

          cmp al,01111010b
          ja a

          and al,11011111b
          mov ds:[si],al

       a: inc si
          jmp l

       b: pop ax
          pop si
          ret

codesg ends
end begin


