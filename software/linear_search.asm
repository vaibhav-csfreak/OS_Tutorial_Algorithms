data segment
arr db 5,3,2,1,4,6
len db $-arr
ele db 3
res deb 0
msg1 db "element found$"
msg2 db "element not found$"
data ends

code segment
assume cs:code,ds:data

start: 
mov ax,data
mov ds,ax
mov cl len
mov ch 0
lea si arr
jmp l1


found:
mov res,1
lea dx msg1
jmp en


l1:
mov al arr[si]
cmp al,ele
jz found
inc si
loop l1
lea dx msg2

en:
mov ah,09h
int 21h
int ah,4ch
int 21h


code ends
end start




