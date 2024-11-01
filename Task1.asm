.model small
.stack 100h
.data

String db 'Today$'

.code

main proc
    mov ax, @data
    mov ds, ax
    
    ; Display the original string
               
     lea dx, String
     
     mov ah, 9
     
     int 21h
     
    mov dx, 10
    mov ah, 2
    int 21h
    
    mov dx, 13
    mov ah,2
    int 21h 
    
    
     mov si, offset String
     mov cx, 5
  psh:
    mov bx, [si]
    push bx
    inc si
    loop psh
    
 mov cx, 5

   pp:
   pop dx
   mov ah,2

   int 21h
   loop pp

    
     mov ah, 4ch
     int 21h
main endp


end main
