assume cs:code
  code segment
  s: mov al,99
   add al,98

   mov ax,4c00h
   int 21h
  code ends
end s
