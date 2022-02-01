.model small
.data
m1 db 10,13,"Char:$"
.code
mov ax,@data
mov ds,ax

;to clear screen
mov ah,00h
mov al,03h
int 10h

;display
lea dx,m1
mov ah,09h
int 21h

;read
mov ah,01h
int 21h

;set cursor position
mov ah,02h
mov dx,0c28h
int 10h

mov bl,al ;keeping copy in bl 

rotr:mov cl,4
     shr al,cl
     cmp al,0ah
     jl next
     add al,07h
     
next:mov dl,al
     add dl,30h
     mov ah,02h
     int 21h
     
lowb:and bl,0fh
     cmp bl,0ah
     jl next1
     add bl,07h
      
next1:mov dl,bl
      add dl,30h
      mov ah,02h
      int 21h
      mov ah,4ch
      int 21h
      end