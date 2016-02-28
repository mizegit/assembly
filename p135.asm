assume cs:codesg,ds:datasg,ss:stacksg

datasg segment
        dw 0123h,0456h
datasg ends

stacksg segment
        dw 0,0
stacksg ends

codesg segment
start:  mov ax,stacksg
        mov ss,ax
        mov sp,16

        mov ax,datasg
        mov ds,ax

        push ds:[0]
        push ds:[2]
        pop ds:[2]
        pop ds:[0]

        mov ax,4c00h
        int 21h
codesg ends

end start
