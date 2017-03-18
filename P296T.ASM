assume cs:code
code segment

start:  mov bx,0b800h
        mov es,bx
        mov byte ptr es:[2602],41h
        mov byte ptr es:[2600],41h
        mov byte ptr es:[2603],00000100b
        mov byte ptr es:[2601],00000100b

        and byte ptr es:[2601],11111111b

        mov ax,4c00h
        int 21h

code ends
end start