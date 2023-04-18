    .code16 

    .global _start

_start:
    movb $0xe, %ah
    movw $0x0, %bx

loop:
    movb msg(%bx),%al
    cmp $0x0, %al
    je  halt
    int $0x10
    add $0x1, %bx
    jmp loop

halt:
    hlt
    jmp halt

msg:
    .string "Hello World"

    .fill 510 - (. - _start), 1, 0
    .word 0xaa55