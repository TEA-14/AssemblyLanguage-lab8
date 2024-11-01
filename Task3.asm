.model small
.stack 100h
.data
    arr db 5, 4, 3, 2, 1   
    msg db 'Popped values: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

   
    lea si, arr
    mov cx, 5                  
    push_values:
        mov al, [si]            
        push ax                 
        inc si                  
        loop push_values

    
    lea dx, msg
    mov ah, 9
    int 21h

   
    mov cx, 5                   
    pop_values:
        pop bx
        add bl, 48                
        mov dl, bl              
                   
        mov ah, 2
        int 21h

        
        mov dl, ' '
        mov ah, 2
        int 21h

        loop pop_values


    ; Using BP to clear the stack 
    mov bp, sp                 
    mov cx, 5                 
    clear_stack:
        pop ax                  
        loop clear_stack

    ; Exit the program
    mov ah, 4Ch
    int 21h

main endp
end main
