assume cs:code

a segment
        dw 1,2,3,4,5,6,7,8,9,0ah,0bh,0ch,0dh,0eh,0fh,0ffh
a ends

b segment
        dw 0,0,0,0,0,0,0,0
b ends

code segment
       start: mov ax,a
        mov ds,ax

        mov ax,b
        mov ss,ax
        mov sp,10h

        mov bx,0
        mov cx,8

      s0: push [bx]
        add bx, 2
        loop s0
code ends

end start
