assume cs:codesg

data segment
        db 2014
        dd 1000
        dw 2000
data ends

table segment
        db 21 dup ('year summ ne ?? ')
table ends

codesg segment

        mov ax,4c00h
        int 21h
code ends

end

