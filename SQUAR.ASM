assume cs:code

code segment
start: mov ax,2
       mov cx,4

    s: add ax,ax
       loop s

       mov ax,4c00h
       int 21h
code ends
end start
