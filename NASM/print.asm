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
        mov     rdx, rax
        pop     rax
        mov     rsi, rax
        mov     rdi, 1
        mov     rax, 1
        syscall
        pop     rdi
        pop     rsi
        pop     rdx
        ret
exit:   mov     rdi, 0
        mov     rax, 0h3C
        syscall
        ret