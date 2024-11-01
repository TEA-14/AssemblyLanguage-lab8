.model small
.stack 100h

.data
    fib db 6 dup(?)  ; Array to store the Fibonacci series
    msg db 'Fibonacci series: $'
 

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Initialize the first two Fibonacci numbers
    mov fib[0], 0
    mov fib[1], 1

    ; Display the message
    lea dx, msg
    mov ah, 9
    int 21h

    ; Calculate the next Fibonacci numbers
    mov cx, 4  ; We need 4 more numbers (6 - 2)
    lea si, fib
    add si, 2  ; Point to fib[2]

    calc_fib:
    ; Load the last two numbers from the array
    mov al, [si-2]
    push ax
    mov al, [si-1]
    push ax

    ; Add the last two numbers
    pop bx
    pop ax
    add al, bl

    ; Store the result in the array
    mov [si], al

    ; Increment the index
    inc si

    ; Loop until all numbers are calculated
    loop calc_fib

    ; Display the Fibonacci series
    lea si, fib
    mov cx, 6  ; We have 6 numbers to display

    display_fib:
    mov dl, [si]
    add dl, '0'  ; Convert the number to its ASCII equivalent
    mov ah, 2
    int 21h

    ; Print a space
    mov dl, ' '
    mov ah, 2
    int 21h

    ; Move to the next number
    inc si
    loop display_fib
    
    ; Exit the program
    mov ah, 4ch
    int 21h

main endp
end main
