; /usr/local/bin/nasm -f macho32 Hello_mac32.asm
; ld -macosx_version_min 10.7.0 -lSystem -o Hello_mac32 Hello_mac32.o
; ./Hello_mac32
; rm Hello_mac32 Hello_mac32.o

global start

section .text
start:
    push    dword msg.len
    push    dword msg
    push    dword 1
    mov     eax, 4
    sub     esp, 4
    int     0x80
    add     esp, 16

    push    dword 0
    mov     eax, 1
    sub     esp, 12
    int     0x80

section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg
