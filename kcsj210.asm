assume cs:codesg, ds:data, es:table

data segment
        db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
        db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
        db '1993','1994','1995'

        dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
        dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000

        dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
        dw 11542,14430,15257,17800
data ends

table segment
        db 11 dup (0)
table ends

codesg segment
 start: mov ax,table
        mov es,ax

        mov ax,data
        mov ds,ax

        mov cx,21
        mov bx,0
        mov si,0
        mov di,0
        mov dh,1
        mov dl,1

     s: mov ax,ds:[si]
        mov es:[bx],ax

        mov ax,ds:[2+si]
        mov es:[2+bx],ax

        call dtoc ; show year
        ;;;year
        
        mov ax,ds:[54h+si]
        mov es:[5+bx],ax
        
        mov ax,ds:[56h+si]
        mov es:[7+bx],ax
        ;;;money
        
        mov ax,ds:[0A8h+di]
        mov es:[0Ah+bx],ax
        ;;;people num
        
        mov ax, es:[5+bx]
        mov dx, es:[7+bx]
        
        div word ptr es:[0Ah+bx]
        mov es:[0dh+bx],ax
        ;;div money by people num
        
        add bx, 10h
        add si, 4
        add di, 2
        loop s

        mov ax, 4c00h
        int 21h
codesg ends

end start


