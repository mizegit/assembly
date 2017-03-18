assume cs:code

code segment
     start: mov ax,0201h
            int 7ch
            mov ax,4c00h
            int 21h
code ends

end start
