len:    push    rdi
        mov     rdi, rax
nextch: cmp     byte [rax], 0
        jz      finish
        inc     rax
        jmp     nextch
finish: sub     rax, rdi
        pop     rdi
        ret
print:  push    rdx
        push    rsi
        push    rdi
        push    rax
        call    len
        mov     rdx, rax  ; size_t count
        pop     rax
        mov     rsi, rax  ; const char *buffer
        mov     rdi, 1    ; stdout
        mov     rax, 1    ; write syscall
        syscall
        pop     rdi
        pop     rsi
        pop     rdx
        ret
exit:   mov     rdi, 0    ; int exit_code
        mov     rax, 0h3C ; exit syscall
        syscall
        ret
