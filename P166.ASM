assume cs:codesg, ds:datasg

datasg segment
  db 'DEC','Ken Oslen'
  dw 137,40
  db 'PDP'
datasg ends


codesg segment
  start: mov ax, datasg
  mov ds,ax

  mov bx,000ch
  mov word ptr [bx],38 

  mov ax, 4c00h
  int 21h
codesg ends

end start
