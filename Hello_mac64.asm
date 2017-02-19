; /usr/local/bin/nasm -f macho64 Hello_mac64.asm 
; ld -macosx_version_min 10.7.0 -arch x86_64 -lSystem -o Hello_mac64 Hello_mac64.o 
; ./Hello_mac

global start

section .text

start:
    mov     rax, 0x2000004 ; write
    mov     rdi, 1 ; stdout
    mov     rsi, msg
    mov     rdx, msg.len
    syscall

    mov     rax, 0x2000001 ; exit
    mov     rdi, 0
    syscall


section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg
