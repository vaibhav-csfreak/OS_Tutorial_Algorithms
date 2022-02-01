.model small

read macro
mov ah,01h
int 21h
endm

write macro
mov ah,02h
int 21h
endm

.data
m1 db 10,13,"String:$"
m2 db 10,13,"String is:$"
str db 100 dup (?)

.code
mov ax,@data
mov ds,ax

lea dx,m1
mov ah,09h
int 21h


lea si,str

iread:read
      mov [si],al
      inc si
      cmp al,0dh
      jnz iread
      lea si,str
      lea dx,m2
      mov ah,09h
      int 21h
iwrite:mov dl,[si]
       write
       inc si
       cmp dl,0dh
       jnz iwrite
       mov ah,4ch
       int 21h
       end
